#include <AFMotor.h>
// Sensores Inflarojos
int sensorDelantero = A0;
int lecturaDelantera = 0;
int Delantero;

int sensorTrasero = A1;
int lecturaTrasera = 0;
int Trasero;

int echo = 9;
int trig = 10;
int duracion, distancia;

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);


void setup() {
  
  Serial.begin(9600);

  pinMode(echo, INPUT);
  pinMode(trig, OUTPUT);

  motor1.setSpeed(255);
  motor2.setSpeed(255);

  motor1.run(RELEASE);
  motor2.run(RELEASE);

  Serial.print("Tiempo de seguridad");
  delay(2000);

}

void loop() {
  // ultrasonico
digitalWrite(trig, HIGH);
delay(0.01);
digitalWrite(trig, LOW);
duracion = pulseIn(echo, HIGH);
distancia = (duracion/2) / 29;
delay(5);

  lecturaDelantera = digitalRead(sensorDelantero);
  lecturaTrasera = digitalRead(sensorTrasero);
  Delantero = lecturaDelantera;
  Trasero = lecturaTrasera;


    //----------DETECTA UN OPONENTE-----------

    if(distancia <= 20 && Delantero == 0 && Trasero == 0)
    {
      motor1.setSpeed(250);
      motor2.setSpeed(250);

      motor1.run(FORWARD);
      motor2.run(FORWARD);

      Serial.println(" ENCONTRO OPONENTE...");
      delay(100);

      }

      
    //----------NO DETECTA UN OPONENTE-----------

    if(distancia >= 21 && Delantero == 0 && Trasero == 0)
    {
      motor1.setSpeed(150);
      motor2.setSpeed(150);

      motor1.run(FORWARD);
      motor2.run(BACKWARD);

            Serial.println(" NO ENCONTRO OPONENTE...");

      }

     //DETECTA OPONENTE PERO DETECTA FINAL DEL RING ADELANTE

     if(Delantero == 1)
     {
        motor1.setSpeed(150);
        motor2.setSpeed(150);

        motor1.run(BACKWARD);
        motor2.run(BACKWARD);

              Serial.println(" RETROCEDE, YA LO SACASTE...");
              delay(1000);

      }

           //DETECTA OPONENTE PERO DETECTA FINAL DEL RING ATRAS

     if( Trasero == 1)
     {
        motor1.setSpeed(150);
        motor2.setSpeed(150);

        motor1.run(FORWARD);
        motor2.run(FORWARD);

              Serial.println(" ADELANTE, NOS ESTAN  SACANDO...");
              delay(1000);

      }


}
