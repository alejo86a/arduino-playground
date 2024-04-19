#include <AFMotor.h>
#include <Servo.h>

Servo servo1;
int servoPin = 10;
int initialPosition = 0;
void setup() {
  servo1.attach(servoPin);

  // Set the initial position
  servo1.write(initialPosition);
}

void loop() {// Move the servo to one extreme position (0 degrees)
  servo1.write(0);
  delay(1000); // Wait for 1 second

  // Move the servo back to the initial position
  servo1.write(initialPosition);
  delay(1000); // Wait for 1 second

  // Move the servo to the other extreme position (180 degrees)
  servo1.write(90);
  delay(1000); // Wait for 1 second
}
