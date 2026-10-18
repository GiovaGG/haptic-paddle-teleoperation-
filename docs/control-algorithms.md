# Controller architecture and design decisions

The project started from an existing low-cost haptic paddle and translated its LabVIEW pipeline into a MATLAB/Simulink-based embedded implementation.

## Master pipeline

1. **Acquisition:** `Analog Input` on Arduino A0.
2. **Startup calibration:** `initial_collection` averages 100 initial samples to establish the mechanical reference (`offset`).
3. **Angular scaling:** `theta = (ADC - offset) * 2*pi/230` after hardware calibration. The 230-count denominator comes from a measured ADC range and avoids an excessive gain present in an earlier scaling expression.
4. **Angular-velocity observer:** estimate angular velocity from position with `omega_hat[k] = Kp (theta[k] - theta_hat[k])`, `theta_hat[k+1] = theta_hat[k] + Ts * omega_hat[k]`, `Ts = 0.02 s`. This is a proportional discrete observer, not a direct rate sensor.
5. **Base viscous feedback:** `tau = -b * omega_hat`; signed command is separated into mutually exclusive motor channels and saturated before reaching the IBT-2.

An experimental observer setting reported after rescaling is approximately `Kp = 1.2`, but tuning is setup-specific.

## Slave position pipeline

Use a two-segment mapping for an asymmetric paddle mechanical range. The integrated model maps 500 ADC → 0°, 680 ADC → 120°, 800 ADC → 180°. A first-order digital filter suppresses servo jitter:

`servo_filtered[k] = 0.1 * servo_raw[k] + 0.9 * servo_filtered[k-1]`

## Proximity and virtual wall

The ultrasonic sensor is read only after the startup-calibration logic permits normal operation. Its raw output is processed in stages:

1. Hold last accepted value for measurements outside **2.5–40 cm**.
2. Reject sudden changes above **3 cm** until the candidate change persists for **three samples**.
3. Apply first-order smoothing with `alpha = 0.3`.
4. Hold previous filtered output for steps smaller than **0.1 cm**.

The distance-dependent gain is:

`K(d) = Kmax * clamp((Dmax-d)/(Dmax-Dmin), 0, 1)^3`

with `Kmax = 0.35`, `Dmax=10 cm`, `Dmin=2 cm`; zero or otherwise invalid input should not introduce a new wall command. (In practice the upstream distance filter maintains its last accepted measurement for some invalid samples.)

## Directionality and hysteresis

A naive increase of viscous damping on *both* directions produced high resistance when moving away from the detected obstacle. Estimating the sign of range velocity via a second observer or finite differences was also unreliable due to HC-SR04 noise; the observer implementation additionally stressed the Arduino Uno's available memory.

The final solution uses the sign of the calibrated paddle angle to identify the obstacle side **when entering the close-range region** (`d < 5 cm`). The captured side remains latched while in proximity, with re-arming after `d > 15 cm`. The wall contribution `K(d)` is added to **only one PWM-processing channel**. The other channel retains the base damping coefficient `b`, allowing retreat without wall-added resistance.

The original thesis MATLAB Function stores `flag_locked` even after releasing `locked` at the upper threshold: therefore, the stored flag can remain 1/2 at long distances. This does **not** create wall resistance at `d > 10 cm`, since `K(d)=0`; on re-entry after release the latch is updated. The extracted MATLAB function in this repository preserves that behavior rather than silently changing it.

The channel-specific functions in the thesis apply `b + K` to a particular PWM preprocessing channel. Any mapping from a logical direction flag to a **physical direction of rotation** must be verified on the device, because PWM channels were inverted during tuning.

## System boundaries

- One-DOF paddle and SG90-controlled LEGO arm; not general 6-DOF telemanipulation.
- Virtual wall is implemented via **velocity-dependent resistance**, not geometric hard-contact enforcement.
- The hardware did not have a dedicated force/torque transducer on the slave.
- The system's validation is experimental and qualitative; do not infer haptic force in newtons, latency in milliseconds or transmission-network performance without additional measurements.
