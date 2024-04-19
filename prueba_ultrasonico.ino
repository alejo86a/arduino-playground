#include <AFMotor.h>

int echo = 9;
int trig = 10;
int duracion, distancia;

AF_DCMotor M1(1);
AF_DCMotor M2(2);

void setup() {
  
    Serial.begin(9600);
    pinMode(echo, INPUT);
    pinMode(trig, OUTPUT);

    M1.run(RELEASE);
    M2.run(RELEASE);

    Serial.println("TIEMPO DE SEGURIDAD");
    delay(1000);
    
}

void loop() {

    digitalWrite (trig, HIGH);
    delay(0.01);
    digitalWrite (trig, LOW);
    duracion = pulseIn(echo, HIGH);
    distancia = (duracion/2)/29;
    Serial.print(distancia);
    Serial.println(" cm");
    delay(1);


    if(distancia <= 30)
    {
      M1.setSpeed(250);
      M2.setSpeed(250);
      M1.run(FORWARD);
      M2.run(FORWARD);
      Serial.println("SE DETECTO UN OPONENTE");
      delay(1000);

    }

    if(distancia >= 30)
    {
      M1.setSpeed(150);
      M2.setSpeed(150);
      M1.run(BACKWARD);
      M2.run(FORWARD);
      Serial.println("SE DETECTO UN OPONENTE");
      delay(10);

    }


}
