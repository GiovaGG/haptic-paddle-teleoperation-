# Standalone Arduino checks (not the final teleoperation firmware)

The two sketches here have been **reconstructed from test listings in Appendix A of the thesis**, then cleaned for readability. They are intended as separate low-level checks. The fully integrated demonstrator was implemented through Simulink, not by simply combining these sketches.

- `paddle_hardware_test/` — verify potentiometer and mutually exclusive DC motor PWM directions. The sketch uses a fixed center of 688 and is **not** a closed-loop haptic controller.
- `slave_sensor_test/` — verify SG90 movement and ultrasonic readings with the **early standalone test calibration** (350/680/850 ↔ 0°/110°/180°). The integrated Simulink controller used a later mapping of 500/680/800 ↔ 0°/120°/180°.

Do not run the motor test while holding the paddle until you have confirmed direction and safe actuation limits. `RPWM=D6` and `LPWM=D5` are the **hardware pin** assignments recorded in the thesis. The final software swapped channel assignments to make torque oppose operator motion.
