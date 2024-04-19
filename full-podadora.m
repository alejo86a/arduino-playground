#include <AFMotor.h>
#include <SoftwareSerial.h>
// SoftwareSerial bluetoothSerial(16, 17); // RX, TX
//initial motors pin
AF_DCMotor motor1(1, MOTOR12_1KHZ);
AF_DCMotor motor2(2, MOTOR12_1KHZ);
AF_DCMotor motor3(3, MOTOR34_1KHZ);
AF_DCMotor motor4(4, MOTOR34_1KHZ);
//SoftwareSerial bluetooth(17, 16);

char command;

void setup()
{
  // bluetooth.begin(9600);
  Serial.begin(9600);
  // bluetoothSerial.begin(9600); 
  // Serial.setTimeout(5);  
 Serial.println("¡Hola desde Arduino Mega WiFi!"); // Imprime el mensaje en el Monitor Serie

}

void loop() {
  // if (bluetooth.available() > 0) { // Verifica si hay datos disponibles para leer del módulo Bluetooth
  //   char receivedChar = bluetooth.read(); // Lee el caracter recibido desde el módulo Bluetooth
  //   Serial.print("Datos recibidos desde Bluetooth: ");
  //   Serial.println(receivedChar); // Imprime el caracter recibido en el Monitor Serie
  // }
  // Serial.println("¡Hola desde Arduino Mega WiFi!"); // Imprime el mensaje en el Monitor Serie
   char codigo;
  String valor = "";
  
  while (Serial.available() > 0) {    // Preguntamos si existe datos leidos por serial
    String linea = Serial.readString();
    for(int i = 0 ;i < linea.length(); i++){
      int caracter = linea[i];
      if (isDigit(caracter)) {        // Preguntamos si es digito
         valor += (char)caracter;     // Guardamos el valor leido
      }else if (caracter != '\n') {   // Preguntamos si es distinto a salto de linea
          codigo = caracter;  
          Serial.println(codigo);
    Serial.print(codigo);        // Guardamos el codigo leido
      }else{
        break;
      }  
    }
  }


    
    switch (codigo) {
      case 'F':
        forward();
        break;
      case 'G':
        back();
        break;
      case 'L':
        left();
        break;
      case 'R':
        right();
        break;
      case 'X':
        Stop();
        break;
      case 'Y':
        changeMode();
        break;
      case 'M':
        encenderPodadora();
        break;
      case 'N':
        apagarPodadora();
        break;
    }
}

void forward()
{
  motor1.setSpeed(255); //Define maximum velocity
  motor1.run(FORWARD);  //rotate the motor clockwise
  motor2.setSpeed(255); //Define maximum velocity
  motor2.run(FORWARD);  //rotate the motor clockwise
  motor3.setSpeed(255); //Define maximum velocity
  motor3.run(FORWARD);  //rotate the motor clockwise
  motor4.setSpeed(255); //Define maximum velocity
  motor4.run(FORWARD);  //rotate the motor clockwise
  motor4.run(FORWARD);  //rotate the motor clockwise
}

void back()
{
  motor1.setSpeed(255); //Define maximum velocity
  motor1.run(BACKWARD); //rotate the motor anti-clockwise
  motor2.setSpeed(255); //Define maximum velocity
  motor2.run(BACKWARD); //rotate the motor anti-clockwise
  motor3.setSpeed(255); //Define maximum velocity
  motor3.run(BACKWARD); //rotate the motor anti-clockwise
  motor4.setSpeed(255); //Define maximum velocity
  motor4.run(BACKWARD); //rotate the motor anti-clockwise
}

void left()
{
  motor1.setSpeed(255); //Define maximum velocity
  motor1.run(BACKWARD); //rotate the motor anti-clockwise
  motor2.setSpeed(255); //Define maximum velocity
  motor2.run(FORWARD); //rotate the motor anti-clockwise
  motor3.setSpeed(255); //Define maximum velocity
  motor3.run(FORWARD);  //rotate the motor clockwise
  motor4.setSpeed(255); //Define maximum velocity
  motor4.run(BACKWARD);  //rotate the motor clockwise
}

void right()
{
  motor1.setSpeed(255); //Define maximum velocity
  motor1.run(FORWARD);  //rotate the motor clockwise
  motor2.setSpeed(255); //Define maximum velocity
  motor2.run(BACKWARD);  //rotate the motor clockwise
  motor3.setSpeed(255); //Define maximum velocity
  motor3.run(BACKWARD); //rotate the motor anti-clockwise
  motor4.setSpeed(255); //Define maximum velocity
  motor4.run(FORWARD); //rotate the motor anti-clockwise
}

void Stop()
{
  motor1.setSpeed(0);  //Define minimum velocity
  motor1.run(RELEASE); //stop the motor when release the button
  motor2.setSpeed(0);  //Define minimum velocity
  motor2.run(RELEASE); //rotate the motor clockwise
  motor3.setSpeed(0);  //Define minimum velocity
  motor3.run(RELEASE); //stop the motor when release the button
  motor4.setSpeed(0);  //Define minimum velocity
  motor4.run(RELEASE); //stop the motor when release the button
}

void changeMode()
{
  motor1.setSpeed(0);  //Define minimum velocity
  motor1.run(RELEASE); //stop the motor when release the button
  motor2.setSpeed(0);  //Define minimum velocity
  motor2.run(RELEASE); //rotate the motor clockwise
  motor3.setSpeed(0);  //Define minimum velocity
  motor3.run(RELEASE); //stop the motor when release the button
  motor4.setSpeed(0);  //Define minimum velocity
  motor4.run(RELEASE); //stop the motor when release the button
}

void encenderPodadora()
{
  motor1.setSpeed(0);  //Define minimum velocity
  motor1.run(RELEASE); //stop the motor when release the button
  motor2.setSpeed(0);  //Define minimum velocity
  motor2.run(RELEASE); //rotate the motor clockwise
  motor3.setSpeed(0);  //Define minimum velocity
  motor3.run(RELEASE); //stop the motor when release the button
  motor4.setSpeed(0);  //Define minimum velocity
  motor4.run(RELEASE); //stop the motor when release the button
}

void apagarPodadora()
{
  motor1.setSpeed(0);  //Define minimum velocity
  motor1.run(RELEASE); //stop the motor when release the button
  motor2.setSpeed(0);  //Define minimum velocity
  motor2.run(RELEASE); //rotate the motor clockwise
  motor3.setSpeed(0);  //Define minimum velocity
  motor3.run(RELEASE); //stop the motor when release the button
  motor4.setSpeed(0);  //Define minimum velocity
  motor4.run(RELEASE); //stop the motor when release the button
}
