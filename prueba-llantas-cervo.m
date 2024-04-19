#include <Servo.h>

// Create a Servo object
Servo servo;

// Define the servo control pin
int servoPin = 13;

// Define the initial position of the servo
int initialPosition = 90; // 90 degrees is the center position
// Define motor control pins
int motor1Pin1 = 9; // Connect to IN1 on the L298N module
int motor1Pin2 = 8; // Connect to IN2 on the L298N module

int motor2Pin1 = 6; // Connect to IN1 on the L298N module
int motor2Pin2 = 7; // Connect to IN2 on the L298N module

void setup() {
  // Initialize motor control pins as outputs
  pinMode(motor1Pin1, OUTPUT);
  pinMode(motor1Pin2, OUTPUT);
  pinMode(motor2Pin1, OUTPUT);
  pinMode(motor2Pin2, OUTPUT);

  // Attach the servo to the control pin
  servo.attach(servoPin);

  // Set the initial position
  servo.write(initialPosition);
}

void loop() {
  // Rotate the motor in one direction
  digitalWrite(motor1Pin1, HIGH);
  digitalWrite(motor1Pin2, LOW);
  // Rotate the motor in one direction
  digitalWrite(motor2Pin1, HIGH);
  digitalWrite(motor2Pin2, LOW);

  // Wait for some time (you can adjust this for the desired speed)
  delay(1000);

  // Rotate the motor in the opposite direction
  digitalWrite(motor1Pin1, LOW);
  digitalWrite(motor1Pin2, HIGH);
  // Rotate the motor in the opposite direction
  digitalWrite(motor2Pin1, LOW);
  digitalWrite(motor2Pin2, HIGH);

  // Wait for some time (you can adjust this for the desired speed)
  delay(1000);

   // Move the servo to one extreme position (0 degrees)
  servo.write(0);
  delay(1000); // Wait for 1 second

//   // Move the servo back to the initial position
//   servo.write(initialPosition);
//   delay(1000); // Wait for 1 second

//   // Move the servo to the other extreme position (180 degrees)
//   servo.write(180);
//   delay(1000); // Wait for 1 second

//   // Move the servo back to the initial position
//   servo.write(initialPosition);
//   delay(1000); // Wait for 1 second
}
