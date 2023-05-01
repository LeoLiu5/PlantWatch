#include <math.h>
#include <DHT.h>
#include <BH1750.h>
#include <Wire.h>
#include <WiFiNINA.h>
#include <PubSubClient.h>
// Wifi and MQTT
#include "arduino_secrets.h"

BH1750 lightMeter;

#define DHTPIN 3           // what pin we're connected to
#define DHTTYPE DHT22      // DHT 22  (AM2302)
DHT dht(DHTPIN, DHTTYPE);  //// Initialize DHT sensor for normal 16mhz Arduino


#define pinOut 4  // what pin we're connected to relay


//Constants
float hum = 0;               //Stores humidity value
float temp = 0;              //Stores temperature value

const int AirValue = 620;    //you need to replace this value with Value_1
const int WaterValue = 310;  //you need to replace this value with Value_2
int soilMoistureValue = 0;
int soilmoisturepercent = 0;

char msg_out[20];

float lux = 0;
/*
**** please enter your sensitive data in the Secret tab/arduino_secrets.h
**** using format below
#define SECRET_SSID "ssid name"
#define SECRET_PASS "ssid password"
#define SECRET_MQTTUSER "user name - eg student"
#define SECRET_MQTTPASS "password";
 */

const char* ssid = SECRET_SSID;
const char* password = SECRET_PASS;
const char* mqttuser = SECRET_MQTTUSER;
const char* mqttpass = SECRET_MQTTPASS;
const char mqtt_server[] = "mqtt.cetools.org";

WiFiClient espClient;
PubSubClient mqttClient(espClient);

void setup() {
  startWifi();
  // start MQTT server
  mqttClient.setServer(mqtt_server, 1883);
  // mqttClient.setCallback(callback);
  Serial.begin(9600);  // open serial port, set the baud rate to 9600 bps
  // Initialize the I2C bus (BH1750 library doesn't do this automatically)
  Wire.begin();
  // lightMeter.begin();
  dht.begin();

}
void loop() {

  //Read data and store it to variables hum and temp
  hum = dht.readHumidity();
  temp = dht.readTemperature();
  //Print temp and humidity values to serial monitor
  Serial.print("Humidity: ");
  Serial.print(hum);
  Serial.print(" %, Temp: ");
  Serial.print(temp);

  // Serial.println(" Celsius");
  // soilMoistureValue = analogRead(A0);  //put Sensor insert into soil
  // Serial.println(soilMoistureValue);

  // soilmoisturepercent = map(soilMoistureValue, AirValue, WaterValue, 0, 100);
  // if (soilmoisturepercent >= 100) {
  //   Serial.println("100 %");
  // } else if (soilmoisturepercent <= 0) {
  //   Serial.println("0 %");
  // } else if (soilmoisturepercent > 0 && soilmoisturepercent < 100) {
  //   Serial.print(soilmoisturepercent);
  //   Serial.println("%");
  // }


  //float lux = lightMeter.readLightLevel();
 

  // digitalWrite(pinOut, LOW);
  // digitalWrite(pinOut, HIGH);



  // sendMQTT();
    // mqttClient.loop();
     // delay(250);
}
void startWifi() {
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  // check to see if connected and wait until you are
  while (WiFi.status() != WL_CONNECTED) {
    // delay(500);
    // Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}
void reconnect() {
  // Loop until we're reconnected
  while (!mqttClient.connected()) {


    Serial.print("Attempting MQTT connection...");

    // Create a random client ID
    String clientId = "mlClient";
    clientId += String(random(0xffff), HEX);
    // mqttClient.connect(clientId.c_str(), mqttuser, mqttpass);
    mqttClient.connect(clientId.c_str());
    // mqttClient.subscribe("UCL/OPS/107/SLS/WS1361_01/dB");
    // mqttClient.subscribe("UCL/OPS/107/MTS/enviro");
    // mqttClient.subscribe("student/CASA0019/TwinLab/RoomCapacity");
    // mqttdisconnected = false;
  }
}
//send message to MQTT
void sendMQTT() {

  if (!mqttClient.connected()) {
    reconnect();
  }
  mqttClient.loop();


  sprintf (msg_out, "%.0f", hum);
  mqttClient.publish("student/ucfniup/SmartGrower/humidity", msg_out);


  sprintf (msg_out, "%.0f", temp);
  mqttClient.publish("student/ucfniup/SmartGrower/temperature", msg_out);
  sprintf (msg_out, "%.0f", lux);
  mqttClient.publish("student/ucfniup/SmartGrower/illuminance", msg_out);



  // mqttClient.publish("student/ucfniup/SmartGrower/humidity", msg);




  // mqttClient.publish("student/ucfniup/SmartGrower/humidity", msg);
}
