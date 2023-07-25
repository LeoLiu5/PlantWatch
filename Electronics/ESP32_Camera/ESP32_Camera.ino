#include "WiFi.h"
#include "esp_camera.h"
#include "Arduino.h"
#include "soc/soc.h"           // Disable brownout problems
#include "soc/rtc_cntl_reg.h"  // Disable brownout problems
#include "driver/rtc_io.h"
#include <SPIFFS.h>
#include <FS.h>
#include <Firebase_ESP_Client.h>
#include <addons/TokenHelper.h>
#include <ezTime.h>

// Replace with your network credentials
const char* ssid = "UCL_IoT";
const char* password = "";

// Date and time
Timezone GB;
String FILE_PHOTO;

// Replace with your Firebase project API Key
#define API_KEY "AIzaSyD7a2TB4xm3WEkmEX07xf30BFMV7EPOEPU"

// Replace with authorized email and corresponding password
#define USER_EMAIL "liu@gmail.com"
#define USER_PASSWORD "123456"

// Replace with your Firebase storage bucket ID e.g. bucket-name.appspot.com
#define STORAGE_BUCKET_ID "lettucewatch-ab76c.appspot.com"

// OV2640 camera module pins (CAMERA_MODEL_AI_THINKER)
#define PWDN_GPIO_NUM     32
#define RESET_GPIO_NUM    -1
#define XCLK_GPIO_NUM      0
#define SIOD_GPIO_NUM     26
#define SIOC_GPIO_NUM     27
#define Y9_GPIO_NUM       35
#define Y8_GPIO_NUM       34
#define Y7_GPIO_NUM       39
#define Y6_GPIO_NUM       36
#define Y5_GPIO_NUM       21
#define Y4_GPIO_NUM       19
#define Y3_GPIO_NUM       18
#define Y2_GPIO_NUM        5
#define VSYNC_GPIO_NUM    25
#define HREF_GPIO_NUM     23
#define PCLK_GPIO_NUM     22

// Define Firebase Data objects
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig configF;

// Capture Photo and Save it to SPIFFS
void capturePhotoSaveSpiffs() {
  Serial.println("Taking picture...");
  camera_fb_t* fb = NULL;

  // Take a photo with the camera
  Serial.println("Taking a photo...");
//   int flash_PIN = 25; //GPIO the LED is connected to, don't forget a current limiting resistor

// pinMode(flash_PIN, OUTPUT);

// digitalWrite(flash_PIN, HIGH);

// delay(5); //just to make sure the image is well lit

fb = esp_camera_fb_get();

// digitalWrite(flash_PIN, LOW);
  if (!fb) {
    Serial.println("Camera capture failed");
    return;
  }

  // Photo file name
  Serial.printf("Picture file name: %s\n", FILE_PHOTO.c_str());
  File file = SPIFFS.open(FILE_PHOTO.c_str(), FILE_WRITE);
  if (!file) {
    Serial.println("Failed to open file in writing mode");
    esp_camera_fb_return(fb);
    return;
  }

  file.write(fb->buf, fb->len);
  Serial.print("The picture has been saved in ");
  Serial.print(FILE_PHOTO);
  Serial.print(" - Size: ");
  Serial.print(file.size());
  Serial.println(" bytes");

  file.close();
  esp_camera_fb_return(fb);
}

void initWiFi() {
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
}

void initSPIFFS() {
  if (!SPIFFS.begin(true)) {
    Serial.println("An Error has occurred while mounting SPIFFS");
    ESP.restart();
  } else {
    delay(500);
    Serial.println("SPIFFS mounted successfully");
  }
}

void initCamera() {
  // OV2640 camera module
  camera_config_t config;
  config.ledc_channel = LEDC_CHANNEL_0;
  config.ledc_timer = LEDC_TIMER_0;
  config.pin_d0 = Y2_GPIO_NUM;
  config.pin_d1 = Y3_GPIO_NUM;
  config.pin_d2 = Y4_GPIO_NUM;
  config.pin_d3 = Y5_GPIO_NUM;
  config.pin_d4 = Y6_GPIO_NUM;
  config.pin_d5 = Y7_GPIO_NUM;
  config.pin_d6 = Y8_GPIO_NUM;
  config.pin_d7 = Y9_GPIO_NUM;
  config.pin_xclk = XCLK_GPIO_NUM;
  config.pin_pclk = PCLK_GPIO_NUM;
  config.pin_vsync = VSYNC_GPIO_NUM;
  config.pin_href = HREF_GPIO_NUM;
  config.pin_sscb_sda = SIOD_GPIO_NUM;
  config.pin_sscb_scl = SIOC_GPIO_NUM;
  config.pin_pwdn = PWDN_GPIO_NUM;
  config.pin_reset = RESET_GPIO_NUM;
  config.xclk_freq_hz = 20000000;
  config.pixel_format = PIXFORMAT_JPEG;
config.grab_mode = CAMERA_GRAB_LATEST;
  if (psramFound()) {
    config.frame_size = FRAMESIZE_UXGA;
    config.jpeg_quality = 10;
    config.fb_count = 2;
  } else {
    config.frame_size = FRAMESIZE_UXGA;
    config.jpeg_quality = 10;
    config.fb_count = 2;
  }

  esp_err_t err = esp_camera_init(&config);
  if (err != ESP_OK) {
    Serial.printf("Camera init failed with error 0x%x", err);
    ESP.restart();
  }
  sensor_t * s = esp_camera_sensor_get();
s->set_brightness(s, 2); 
s->set_contrast(s, 2);       // -2 to 2
s->set_saturation(s, -2);     // -2 to 2
       s->set_gain_ctrl(s, 1);                       // auto gain on
       s->set_exposure_ctrl(s, 1);                   // auto exposure on
       s->set_awb_gain(s, 1);                        // Auto White Balance enable (0 or 1)

}

void setup() {
  Serial.begin(115200);
  initWiFi();
  initSPIFFS();
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0);
  initCamera();
  Serial.print("ESP camera MAC Address:  ");
  Serial.println(WiFi.macAddress());
  size_t heapSize = ESP.getHeapSize();
  size_t freeHeap = ESP.getFreeHeap();

  Serial.print("Heap size: ");
  Serial.print(heapSize);
  Serial.println(" bytes");
  Serial.print("Free heap memory: ");
  Serial.print(freeHeap);
  Serial.println(" bytes");

  configF.api_key = API_KEY;
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;
  configF.token_status_callback = tokenStatusCallback;
  configF.max_token_generation_retry = 5;
  Firebase.begin(&configF, &auth);
  Firebase.reconnectWiFi(true);
  waitForSync();
  GB.setLocation("Europe/London");
  // removeAllFiles();

}

void listAllFiles(){
 
  File root = SPIFFS.open("/");
 
  File file = root.openNextFile();
 
  while(file){
 
      Serial.print("FILE: ");
      Serial.println(file.name());
 
      file = root.openNextFile();
  }
 
}

void loop() {
  FILE_PHOTO = "/" + String(GB.dateTime("d-m-y")) + "/" + String(GB.dateTime("H:i")) + ".jpg";
  Serial.println(FILE_PHOTO);
  capturePhotoSaveSpiffs();
  delay(30);

  if (Firebase.ready()) {
    Serial.print("Uploading picture... ");
    if (Firebase.Storage.upload(&fbdo, STORAGE_BUCKET_ID, FILE_PHOTO, mem_storage_type_flash, FILE_PHOTO, "image/jpeg")) {
      Serial.printf("\nDownload URL: %s\n", fbdo.downloadURL().c_str());
      if (SPIFFS.remove(FILE_PHOTO)) {
        Serial.println("Local photo file deleted");
      } else {
        Serial.println("Failed to delete local photo file");
      }
    } else {
      Serial.println(fbdo.errorReason());
    }
  }

  delay(1000 * 300);
}