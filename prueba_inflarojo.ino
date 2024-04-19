//negro marca 1 - blanco marca 0

int sensorTrasero = A0;
int lecturaTrasera = 0;

int sensorDelantero = A1;
int lecturaDelantera = 0;

void setup() 
{
  Serial.begin(9600);
  delay(100);
    
}

void loop() 
{
  lecturaTrasera = digitalRead(sensorTrasero);
  lecturaDelantera = digitalRead(sensorDelantero);

  Serial.print("Sensor Trasero: ");
  Serial.print(lecturaTrasera);
  Serial.print("     Sensor Delantero: ");
  Serial.println(lecturaDelantera);
  delay(50);
}
