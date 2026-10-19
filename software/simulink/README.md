# Simulink subsystem documentation (thesis screenshots)

The MATLAB `.m` files previously published here were *reference reconstructions*, not the executable MATLAB Function blocks from the final Simulink model. They have been removed to avoid confusion.

**These images show the actual Simulink diagrams extracted from the bachelor's thesis.** They are documentation only, not editable blocks or a substitute for the original `.slx` model, which has not been shared.

## Paddle position — analog-to-radian conversion
![ADC-to-angle subsystem](../../assets/simulink/adc-to-angle.png)

The analog reading is offset-calibrated and converted to angular displacement.

## Estimated angular velocity — proportional observer
![Proportional velocity observer subsystem](../../assets/simulink/velocity-observer.png)

The observed velocity is used to implement viscous haptic damping.

## Signed motor command — PWM preprocessing
![PWM preprocessing subsystem](../../assets/simulink/pwm-preprocessing.png)

Separate motor-direction commands feed the IBT-2 driver through saturation stages.

## Arduino hardware integration
![Arduino master paddle integration](../../assets/simulink/arduino-integration.png)

The controller interfaces with the paddle potentiometer and DC-motor control.

## Slave servo and HC-SR04 distance sensing
![Servo control and filtering](../../assets/simulink/servo-control.png)

![Ultrasonic sensor processing](../../assets/simulink/ultrasonic-distance.png)

The paddle position is mapped to the SG90 angular reference; the ultrasonic sensor provides the distance-based feedback signal.

## Direction-dependent virtual wall
![Directional obstacle subsystem](../../assets/simulink/directional-wall.png)

![Directional PWM haptic feedback subsystem](../../assets/simulink/directional-pwm.png)

The virtual-wall resistance increases only toward the detected obstacle, avoiding additional resistance on retreat.

## Complete integration
![Final integrated haptic teleoperation system](../../assets/simulink/complete-system.png)

Additional screenshots and the figure/page references are available in the [complete gallery](../../docs/simulink-screenshots.md).

**Important:** The project has no directly runnable Simulink `.slx` file or fully validated MATLAB Function source in this repository. Arduino `.ino` files are standalone hardware tests, not the final teleoperation model.