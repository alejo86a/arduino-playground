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
}
