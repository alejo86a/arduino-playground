// Define the LED pin
int ledPin = 13;

// Setup function, runs once at the beginning
void setup() {
  // Initialize the LED pin as an output
  pinMode(ledPin, OUTPUT);
}

// Loop function, runs repeatedly
void loop() {
  // Turn the LED on
  digitalWrite(ledPin, HIGH);
  delay(1000); // Wait for 1 second (1000 milliseconds)

  // Turn the LED off
  digitalWrite(ledPin, LOW);
  delay(1000); // Wait for 1 second (1000 milliseconds)
}
