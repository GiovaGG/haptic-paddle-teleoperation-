# Hardware setup and pinout

This document reproduces the connections reported in the bachelor's thesis. Verify all connections against **your physical device**. This is a prototype, not a certified hardware design.

## Paddle (master)

| Source | Destination | Function |
| --- | --- | --- |
| Potentiometer end | Arduino 5 V | Potentiometer supply |
| Potentiometer other end | Arduino GND | Ground |
| Potentiometer wiper | Arduino A0 | ADC position input |
| IBT-2 RPWM | Arduino D6 | Motor drive PWM channel |
| IBT-2 LPWM | Arduino D5 | Opposite PWM channel |
| IBT-2 R_EN, L_EN, VCC | Arduino 5 V | Logic supply / channel enable |
| IBT-2 GND | Arduino GND | Common logic reference |
| IBT-2 B+, B- | External 12 V / 3 A supply (+, -) | DC motor power |
| IBT-2 M+, M- | DC motor terminals | Motor output |

**Important:** The thesis pinout specifies `RPWM → D6` and `LPWM → D5`. An early direction test required **swapping which command is assigned to which PWM channel in software** to generate resistive, rather than assisting, torque. Hardware signal pins and controller-channel assignments are different things. Confirm correct motor sign before applying feedback.

## Robot arm (slave)

| Device | Arduino | Function |
| --- | --- | --- |
| SG90 signal | D9 | Servo position command |
| SG90 power | 5 V and GND | Servo supply (check current draw) |
| HC-SR04 Trig | D7 | Trigger output |
| HC-SR04 Echo | D8 | Echo input |
| HC-SR04 power | 5 V and GND | Sensor supply |

## Recorded calibration and parameters

- Potentiometer nominal midpoint: approximately **688 ADC counts**; offset is obtained automatically at startup.
- Recorded useful travel for paddle angle conversion: approximately **230 ADC counts** for a mechanical rotation associated with `2π` rad in the model.
- Servo mapping in integrated controller: ADC **500–680–800** maps to **0°–120°–180°**; first-order smoothing with alpha **0.1**.
- Arduino processing step: **0.02 s** (fixed step).
- Wall onset **10 cm**, maximum wall-gain region near **2 cm**; enter/exit directional latch at **5 cm / 15 cm**.

## Actuator safety

- Do not power the DC motor directly from an Arduino I/O pin. The external driver and appropriate power supply are required.
- Power must be disconnected while rewiring; ensure a **common ground** is correctly implemented.
- Confirm the actual motor's rated voltage/current, heat dissipation and stall behavior before energizing it; the cited 12 V supply is the thesis setup, not a universal motor recommendation.
- Keep hands clear of moving shafts/gears during tests. Start with low PWM limits and an accessible power-off method.
- A motor can drive the paddle **into** an operator's hand if the polarity or control logic is reversed. Test sign and saturations with the paddle unloaded before human interaction.
- The ultrasonic sensor has limited accuracy near its minimum range; measured distance is **not contact force**.
- Ensure Arduino's 5 V rail can safely support any attached servomotor under expected load; use a separately rated 5 V servo supply with common ground if the load requires it.
