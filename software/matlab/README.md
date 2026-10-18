# MATLAB controller functions

This folder contains human-readable **reference functions from or refactored from the thesis equations**. They help a technical reviewer inspect the implemented design decisions. They are **not** the integrated Arduino Simulink application.

Call `run_basic_tests` in MATLAB to exercise simple deterministic checks (not a substitute for hardware validation). The full `.slx` model is not part of this package.

- `adc_to_radians`: calibrated potentiometer scaling.
- `adc_to_servo_angle`: asymmetric piecewise servo reference mapping.
- `virtual_wall_gain`: cubic proximity gain.
- `directional_obstacle_flag`: directional state with 5/15 cm hysteresis. Preserves the thesis's retained flag behavior after release.
- `ultrasonic_distance_filter`: out-of-range, spike, low-pass and deadband processing.
- `left_channel_gain`, `right_channel_gain`: conditional damping gain inside PWM preprocessing; **sign/channel wiring must be verified in hardware**.

The original Simulink also contains initial offset collection, a proportional observer, PWM splitting/saturation and Arduino hardware blocks.
