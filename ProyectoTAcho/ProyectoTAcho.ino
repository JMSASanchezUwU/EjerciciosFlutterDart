#include <WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>
#include "DHT.h"

// Constantes para conexión con el cliente MQTT
const char* MQTT_CLIENT_ID = "";
const char* MQTT_BROKER = "192.168.16.243";
const char* MQTT_USER = "";
const char* MQTT_PASSWORD = "";
const int MQTT_PORT = 1883;

// Pines
const int SCL_PIN = 22;
const int SDA_PIN = 21;
const int PULSO_PIN = 34;
const int LED_VERDE_PIN = 13;
const int LED_ROJO_PIN = 12;
const int BUZZER_PIN = 15;
const int DHT_PIN = 4;

// Variables para los LEDs y buzzer
int led_verde = LED_VERDE_PIN;
int led_rojo = LED_ROJO_PIN;
int buzzer = BUZZER_PIN;

// Definición del sensor DHT11
#define DHTTYPE DHT11
DHT dht(DHT_PIN, DHTTYPE);

// Conexión a WiFi
void conectarWifi() {
  WiFi.begin("POCO X3 Pro", "123456789");

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(100);
  }

  Serial.println("Megacable");
  Serial.println("Conectado a la red WiFi");
}

// Cliente MQTT
WiFiClient espClient;
PubSubClient client(espClient);

// Conectar al broker MQTT
void conectarBroker() {
  client.setServer(MQTT_BROKER, MQTT_PORT);
  while (!client.connected()) {
    Serial.print("Conectando al broker MQTT...");
    if (client.connect(MQTT_CLIENT_ID, MQTT_USER, MQTT_PASSWORD)) {
      Serial.println("Conectado");
    } else {
      Serial.print("falló, rc=");
      Serial.print(client.state());
      Serial.println(" Intentando de nuevo en 5 segundos");
      delay(5000);
    }
  }
}

void setup() {
  Serial.begin(115200);
  Wire.begin(SDA_PIN, SCL_PIN);
  dht.begin();
  pinMode(led_verde, OUTPUT);
  pinMode(led_rojo, OUTPUT);
  pinMode(buzzer, OUTPUT);

  conectarWifi();
  conectarBroker();
}

void loop() {
  // Leer el sensor DHT11
  float temperature = dht.readTemperature();
  float humidity = dht.readHumidity();

  // Leer el sensor giroscopio (simulado)
  int ax = random(-1000, 1000);
  int ay = random(-1000, 1000);
  int az = random(-1000, 1000);

  // Imprimir datos del sensor en la consola
  Serial.print("Temperatura: ");
  Serial.print(temperature);
  Serial.println(" °C");
  Serial.print("Humedad: ");
  Serial.print(humidity);
  Serial.println(" %");
  Serial.print("Giroscopio - AX: ");
  Serial.print(ax);
  Serial.print(", AY: ");
  Serial.print(ay);
  Serial.print(", AZ: ");
  Serial.println(az);
  Serial.print("Pulso cardiaco: ");
  Serial.println(analogRead(PULSO_PIN));  // Lectura del sensor de pulso

  // Publicación de los datos de temperatura
  char tempString[8];
  dtostrf(temperature, 6, 2, tempString);
  client.publish("utng/proyecto/temperature", tempString);
  Serial.print("Publicando temperatura: ");
  Serial.print(temperature);
  Serial.println(" °C en el tópico utng/proyecto/temperature");

  // Publicación de los datos de humedad
  char humString[8];
  dtostrf(humidity, 6, 2, humString);
  client.publish("utng/proyecto/humidity", humString);
  Serial.print("Publicando humedad: ");
  Serial.print(humidity);
  Serial.println(" % en el tópico utng/proyecto/humidity");

  // Publicación de los datos del giroscopio en tópicos individuales
  char axString[8];
  char ayString[8];
  char azString[8];
  itoa(ax, axString, 10);
  itoa(ay, ayString, 10);
  itoa(az, azString, 10);

  client.publish("utng/proyecto/gyroscope/ax", axString);
  client.publish("utng/proyecto/gyroscope/ay", ayString);
  client.publish("utng/proyecto/gyroscope/az", azString);

  Serial.print("Publicando giroscopio AX: ");
  Serial.println(ax);
  Serial.print("Publicando giroscopio AY: ");
  Serial.println(ay);
  Serial.print("Publicando giroscopio AZ: ");
  Serial.println(az);

  // Publicación de los datos del sensor de pulso
  int pulseValue = analogRead(PULSO_PIN);
  char pulseString[8];
  itoa(pulseValue, pulseString, 10);
  client.publish("utng/proyecto/pulse", pulseString);
  Serial.print("Publicando pulso cardiaco: ");
  Serial.print(pulseValue);
  Serial.println(" en el tópico utng/proyecto/pulse");

  // Encender o apagar el LED rojo y activar el buzzer si la temperatura es alta
  if (temperature > 38) {
    digitalWrite(led_rojo, HIGH);
    digitalWrite(led_verde, LOW);
    digitalWrite(buzzer, HIGH);
    Serial.println("Temperatura alta. Activando buzzer.");
  } else {
    digitalWrite(led_rojo, LOW);
    digitalWrite(led_verde, HIGH);
    digitalWrite(buzzer, LOW);
  }

  delay(10000);
}
