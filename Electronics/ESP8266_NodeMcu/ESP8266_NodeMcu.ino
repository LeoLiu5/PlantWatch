#include <ESP8266WiFi.h>
#include <DHT.h>

#define LED_PIN 16  //D0
#define TdsSensorPin A0
#define VREF 3.3
#define SCOUNT 30
#define DHTPIN 5            // D1 pin we're connected to
#define DHTTYPE DHT22       // DHT 22  (AM2302)
DHT dhtA(DHTPIN, DHTTYPE);  //// Initialize DHT sensor for normal 16mhz Arduino
#include <ezTime.h>
const int trigPin = 2;  //D4
const int echoPin = 0;  //D3
// defines variables
long duration;
int distance;
String LEDstatus = "LED/Status";
#define FIREBASE_PROJECT_ID "lettucewatch-ab76c"
#include <Firebase_ESP_Client.h>
#include <addons/TokenHelper.h>
// Provide the RTDB payload printing info and other helper functions.
#include <addons/RTDBHelper.h>
/* 3. Define the RTDB URL */
#define DATABASE_URL "lettucewatch-ab76c-default-rtdb.europe-west1.firebasedatabase.app"
#define FIREBASE_AUTH "LEWg3dqwjHWWHffjsmBNfDsNTVccIEU3CW4eEfLe"
#define FIREBASE_HOST "testel-23702.firebaseio.com"
float hum;   //Stores humidity value
float temp;  //Stores temperature value
const char* ssid = "CE-Hub-Student";
const char* password = "";
// Date and time
Timezone GB;
// Replace with your Firebase project API Key
#define API_KEY "AIzaSyD7a2TB4xm3WEkmEX07xf30BFMV7EPOEPU"
// Define Firebase Data objects
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig configF;
// Replace with authorized email and corresponding password
#define USER_EMAIL "liu2@gmail.com"
#define USER_PASSWORD "123456"
unsigned long count = 0;
int analogBuffer[SCOUNT];
int analogBufferTemp[SCOUNT];
int analogBufferIndex = 0, copyIndex = 0;
float averageVoltage = 0, tdsValue = 0, temperature = 25;

void setup() {
  Serial.begin(115200);
  // run initialisation functions
  startWifi();
  pinMode(TdsSensorPin, INPUT);
  pinMode(trigPin, OUTPUT);  // Sets the trigPin as an Output
  pinMode(echoPin, INPUT);   // Sets the echoPin as an Input
  pinMode(LED_PIN, OUTPUT);
  pinMode(DHTPIN, INPUT);
  dhtA.begin();

  configF.api_key = API_KEY;
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;
  configF.token_status_callback = tokenStatusCallback;
  configF.max_token_generation_retry = 5;
  Firebase.begin(&configF, &auth);
  Firebase.reconnectWiFi(true);
  // digitalWrite(LED_PIN, HIGH);

  syncDate();
}
void startWifi() {
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  // check to see if connected and wait until you are
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  // Check Firebase connection every 5 minutes (adjust the interval as needed)
  static unsigned long firebaseCheckTimepoint = millis();
  if (millis() - firebaseCheckTimepoint > 7200000U) {
    firebaseCheckTimepoint = millis();
    checkFirebaseConnection();
  }

  // Send keep-alive request every 2 hour (adjust the interval as needed)
  static unsigned long keepAliveTimepoint = millis();
  if (millis() - keepAliveTimepoint > 7200000U) {
    keepAliveTimepoint = millis();
    sendKeepAliveRequest();
  }

  static unsigned long led = millis();
  if (millis() - led > 30000U) {
    led = millis();
    if (Firebase.Firestore.getDocument(&fbdo, FIREBASE_PROJECT_ID, "", LEDstatus.c_str(), "")) {
      Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());

      // Create a FirebaseJson object and set content with received payload
      FirebaseJson payload;
      payload.setJsonData(fbdo.payload().c_str());

      // Get the data from FirebaseJson object
      FirebaseJsonData jsonData;
      payload.get(jsonData, "fields/now/stringValue", true);
      Serial.println(jsonData.stringValue);
      if (digitalRead(LED_PIN) == HIGH) {
        Serial.println("HIGH");
      } else {
        Serial.println("LOW");
      };
      if (jsonData.stringValue == "on") {

        digitalWrite(LED_PIN, LOW);
        Serial.println("ledStateon");
        return;
      };
      if (jsonData.stringValue == "off") {

        digitalWrite(LED_PIN, HIGH);
        Serial.println("ledStateoff");
        return;
      };
      return;
    }
  }
  static unsigned long ledTimepoint = millis();
  if (millis() - ledTimepoint > 12UL * 60UL * 60UL * 1000UL) {
    ledTimepoint = millis();

    FirebaseJson content;
    if (digitalRead(LED_PIN) == HIGH) {
      content.set("fields/now/stringValue", String("on").c_str());
      digitalWrite(LED_PIN, LOW);
    } else {
      content.set("fields/now/stringValue", String("off").c_str());
      digitalWrite(LED_PIN, HIGH);
    };

    if (Firebase.Firestore.patchDocument(&fbdo, FIREBASE_PROJECT_ID, "", LEDstatus.c_str(), content.raw(), "now")) {
      // Serial.print("ok\n%s\n\n", fbdo.payload().c_str());
      return;
    } else {
      Serial.println(fbdo.errorReason());
    }
  }

  static unsigned long analogSampleTimepoint = millis();
  if (millis() - analogSampleTimepoint > 480U) {
    analogSampleTimepoint = millis();
    analogBuffer[analogBufferIndex] = analogRead(TdsSensorPin);
    analogBufferIndex++;
    if (analogBufferIndex == SCOUNT)
      analogBufferIndex = 0;
  }
  static unsigned long printTimepoint = millis();
  if (millis() - printTimepoint > 600000U) {
    printTimepoint = millis();
    for (copyIndex = 0; copyIndex < SCOUNT; copyIndex++)
      analogBufferTemp[copyIndex] = analogBuffer[copyIndex];
    averageVoltage = getMedianNum(analogBufferTemp, SCOUNT) * (float)VREF / 1024.0;
    float compensationCoefficient = 1.0 + 0.02 * (temperature - 25.0);
    float compensationVolatge = averageVoltage / compensationCoefficient;
    tdsValue = (133.42 * compensationVolatge * compensationVolatge * compensationVolatge - 255.86 * compensationVolatge * compensationVolatge + 857.39 * compensationVolatge) * 0.5;
    //Read data and store it to variables hum and temp

    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);

    // Sets the trigPin on HIGH state for 10 micro seconds
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);

    // Reads the echoPin, returns the sound wave travel time in microseconds
    duration = pulseIn(echoPin, HIGH);

    // Calculating the distance
    distance = duration * 0.034 / 2;
    String documentPath = String(GB.dateTime("Y-m-d")) + "/" + String(GB.dateTime("H:i"));
    FirebaseJson content;

    content.set("fields/temperature/doubleValue", String(dhtA.readTemperature()).c_str());
    content.set("fields/humidity/doubleValue", String(dhtA.readHumidity()).c_str());
    content.set("fields/TDS/doubleValue", String(tdsValue).c_str());
    content.set("fields/distance/doubleValue", String(distance).c_str());
    if (Firebase.Firestore.patchDocument(&fbdo, FIREBASE_PROJECT_ID, "", documentPath.c_str(), content.raw(), "temperature,humidity,TDS,distance")) {
      // Serial.print("ok\n%s\n\n", fbdo.payload().c_str());
      return;
    } else {
      Serial.println(fbdo.errorReason());
    }

    if (Firebase.Firestore.createDocument(&fbdo, FIREBASE_PROJECT_ID, "", documentPath.c_str(), content.raw())) {
      // Serial.print("ok\n%s\n\n", fbdo.payload().c_str());
      return;
    } else {
      Serial.println(fbdo.errorReason());
    }




    delay(1000);  // Wait for 1 second before publishing again
  }
}

int getMedianNum(int bArray[], int iFilterLen) {
  int bTab[iFilterLen];
  for (byte i = 0; i < iFilterLen; i++)
    bTab[i] = bArray[i];
  int i, j, bTemp;
  for (j = 0; j < iFilterLen - 1; j++) {
    for (i = 0; i < iFilterLen - j - 1; i++) {
      if (bTab[i] > bTab[i + 1]) {
        bTemp = bTab[i];
        bTab[i] = bTab[i + 1];
        bTab[i + 1] = bTemp;
      }
    }
  }
  if ((iFilterLen & 1) > 0)
    bTemp = bTab[(iFilterLen - 1) / 2];
  else
    bTemp = (bTab[iFilterLen / 2] + bTab[iFilterLen / 2 - 1]) / 2;
  return bTemp;
}
void syncDate() {
  // get real date and time
  waitForSync();
  Serial.println("UTC: " + UTC.dateTime());
  // GB.setLocation("Europe/Luxembourg");
  GB.setLocation("Europe/London");
  Serial.println("London time: " + GB.dateTime());
}
void checkFirebaseConnection() {
  if (!Firebase.ready()) {
    Serial.println("Firebase connection lost. Reconnecting...");
    WiFi.disconnect(true);
    delay(1000);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
      delay(500);
      Serial.print(".");
    }
    Serial.println("\nWiFi reconnected");

    Firebase.begin(&configF, &auth);
    if (Firebase.ready()) {
      Serial.println("Reconnected to Firebase");
    } else {
      Serial.println("Firebase connection failed");
    }
  }
}



void sendKeepAliveRequest() {
  Firebase.reconnectWiFi(true);
  Serial.println("Keep-alive request sent");
}
