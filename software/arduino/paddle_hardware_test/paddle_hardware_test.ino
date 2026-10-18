// Standalone Arduino hardware check, reconstructed from thesis Appendix A.
// NOT the closed-loop haptic teleoperation controller.
// Verify motor polarity and remove load before testing.
const int POT_PIN = A0;
const int RPWM = 6;
const int LPWM = 5;
const int CENTRO_ADC = 688;
const int TOLLERANZA = 15;
const int PWM_MINIMO = 50;

void setup() {
  Serial.begin(9600);
  pinMode(RPWM, OUTPUT);
  pinMode(LPWM, OUTPUT);
  analogWrite(RPWM, 0);
  analogWrite(LPWM, 0);
}

void loop() {
  int adcValue = analogRead(POT_PIN);
  float voltage = adcValue * (5.0f / 1023.0f);
  const char *state = "STOP";

  if (adcValue > CENTRO_ADC + TOLLERANZA) {
    int speed = map(adcValue, CENTRO_ADC + TOLLERANZA, 1023, PWM_MINIMO, 255);
    analogWrite(LPWM, 0);
    analogWrite(RPWM, constrain(speed, 0, 255));
    state = "Forward test";
  } else if (adcValue < CENTRO_ADC - TOLLERANZA) {
    int speed = map(adcValue, CENTRO_ADC - TOLLERANZA, 0, PWM_MINIMO, 255);
    analogWrite(RPWM, 0);
    analogWrite(LPWM, constrain(speed, 0, 255));
    state = "Reverse test";
  } else {
    analogWrite(RPWM, 0);
    analogWrite(LPWM, 0);
  }
  Serial.print("ADC: "); Serial.print(adcValue);
  Serial.print(" | V: "); Serial.print(voltage, 2);
  Serial.print(" | "); Serial.println(state);
  delay(50);
}
