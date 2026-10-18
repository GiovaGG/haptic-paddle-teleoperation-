# Simulink model screenshots — from the thesis

These are **authentic screenshots embedded in Giovanni Gentiloni Silveri's bachelor's thesis** (2026). They illustrate the design and development stages. **They are not editable `.slx` models, source code, or proof of plug-and-play reproducibility.** Figure descriptions follow the thesis's technical narrative.

| Processing and embedded control | Master–slave integration |
| --- | --- |
| **ADC → angle (thesis PDF p. 13)**<br><img alt="Simulink analog-to-radian subsystem" src="../assets/simulink/adc-to-angle.png" width="420"> | **Servo mapping and filtering (p. 59)**<br><img alt="Servo angle mapping and first-order discrete low-pass filter" src="../assets/simulink/servo-control.png" width="420"> |
| **Angular velocity observer (p. 15)**<br><img alt="Simulink proportional velocity observer" src="../assets/simulink/velocity-observer.png" width="420"> | **HC-SR04 sensor chain (p. 61)**<br><img alt="Arduino ultrasonic distance and servo processing in Simulink" src="../assets/simulink/ultrasonic-distance.png" width="420"> |
| **PWM preprocessing (p. 16)**<br><img alt="Two signed PWM motor-control channels" src="../assets/simulink/pwm-preprocessing.png" width="420"> | **Directional obstacle logic (p. 66)**<br><img alt="Position and distance based obstacle direction flag" src="../assets/simulink/directional-wall.png" width="420"> |
| **Original Simulink controller (p. 23)**<br><img alt="Test03 Simulink control system" src="../assets/simulink/baseline-controller.png" width="420"> | **Direction-selective PWM gains (p. 74)**<br><img alt="Direction-dependent damping control in PWM paths" src="../assets/simulink/directional-pwm.png" width="420"> |
| **Arduino paddle integration (p. 41)**<br><img alt="Arduino paddle hardware integration" src="../assets/simulink/arduino-integration.png" width="420"> | **Final integrated model (p. 78)**<br><img alt="Final complete Simulink teleoperation and haptic controller model" src="../assets/simulink/complete-system.png" width="420"> |

**Reading the architecture:** the master paddle is sensed at A0; its angular position drives both the damping controller and the servo reference. The slave servo is commanded through pin D9. The HC-SR04's distance measurement enters a filtered proximity-feedback channel; a latched directional flag controls which PWM branch receives additional damping.

For a detailed explanation of the model's design, see [Control algorithms](control-algorithms.md). The source `.slx` project remains to be added by the author.
