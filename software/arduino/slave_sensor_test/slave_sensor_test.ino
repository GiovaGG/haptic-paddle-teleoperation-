// Standalone SG90 + HC-SR04 check reconstructed from thesis Appendix A.
// Note: this sketch uses the earlier standalone calibration, not the final Simulink mapping.
#include <Servo.h>
Servo myServo;
const int POT_PIN = A0;
const int TRIG_PIN = 7;
const int ECHO_PIN = 8;
const int POT_MIN = 350;
const int POT_MID = 680;
const int POT_MAX = 850;

void setup() {
  Serial.begin(9600);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  myServo.attach(9);
  myServo.write(110);
  delay(500);
}

void loop() {
  const int adc = analogRead(POT_PIN);
  int angle;
  if (adc < POT_MID) {
    angle = map(adc, POT_MIN, POT_MID, 0, 110);
  } else {
    angle = map(adc, POT_MID, POT_MAX, 110, 180);
  }
  angle = constrain(angle, 0, 180);
  myServo.write(angle);

  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  unsigned long duration_us = pulseIn(ECHO_PIN, HIGH, 30000UL);
  // No echo returns 0: treat as invalid rather than "distance = 0".
  float distance_cm = duration_us ? duration_us * 0.0343f / 2.0f : -1.0f;

  Serial.print("ADC: "); Serial.print(adc);
  Serial.print(" | Servo: "); Serial.print(angle);
  Serial.print(" deg | Distance: ");
  if (distance_cm < 0) Serial.println("no echo");
  else { Serial.print(distance_cm, 1); Serial.println(" cm"); }
  delay(20);
}
