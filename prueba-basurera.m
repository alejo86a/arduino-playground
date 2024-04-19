#include <Servo.h>

// Create a Servo object
Servo servo;

// Define the servo control pin
int servoPin = 13;

// Define the initial position of the servo
int initialPosition = 90; // 90 degrees is the center position

void setup() {
  // Attach the servo to the control pin
  servo.attach(servoPin);

  // Set the initial position
  servo.write(initialPosition);
}

void loop() {
//   // Move the servo to one extreme position (0 degrees)
   servo.write(0);
   delay(1000); // Wait for 1 second

//   // Move the servo back to the initial position
   servo.write(initialPosition);
   delay(1000); // Wait for 1 second

//   // Move the servo to the other extreme position (180 degrees)
//   servo.write(180);
//   delay(1000); // Wait for 1 second

//   // Move the servo back to the initial position
//   servo.write(initialPosition);
//   delay(1000); // Wait for 1 second
}
