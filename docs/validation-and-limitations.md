# Validation and limitations

## Evidence documented in the thesis

- Components were checked in independent Arduino tests before integration.
- The original control processing was reconstructed in Simulink, initially assessed in simulation, and subsequently deployed to Arduino Uno.
- Hardware tuning addressed motor-direction inversion, sensor-offset scaling, velocity-observer sensitivity and actuator saturation.
- A LEGO robotic arm followed the paddle command through an SG90 servo with a filtered angular reference.
- An HC-SR04 distance measurement modulated resistive haptic feedback to create a proximity-dependent virtual wall.
- A direction latch with hysteresis reduced additional resistance when moving away from an obstacle.
- Limitations of Uno memory and Connected IO for ultrasonic pulse measurement influenced the final architecture.

## What should NOT be claimed

- No measured closed-loop delay, bandwidth, tracking-error RMSE or peak torque is provided here.
- The obstacle interaction does not directly measure force at the slave end effector.
- There is no evidence of validated operation across a network or the public Internet.
- A servo command reproduces the **mapped** paddle position, not necessarily an identical angle or torque.
- The Simulink screenshots and appendix Arduino tests are not a runnable replacement for the absent `.slx` model.
- Photos and three short demonstration videos are available. Original CAD exports and the complete `.slx` are not included.

## Further validation to make this stronger for employers

1. Record a short demonstration of free motion, approach, virtual-wall feedback and retreat.
2. Plot ADC angle, servo command, filtered obstacle distance, `K(d)` and separate PWM channels over time.
3. Measure servo tracking error and sensor/actuation latency using timestamped traces.
4. Report memory utilization and CPU behavior for the final model, with compiler configuration.
5. Release the exact `.slx`, used CAD and bill of materials if you have rights to do so.
