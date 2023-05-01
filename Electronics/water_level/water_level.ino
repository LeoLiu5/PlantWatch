/* Water Level Meter

Measuring water level with ultrasonic sensor HR S04.

Arduino IDE 1.5.8
*/

int d = 18; //Enter depth of your tank here in centimeters
int trig = 1; // Attach Trig of ultrasonic sensor to pin 11
int echo = 2; // Attach Echo of ultrasonic sensor to pin 10

// Establish variables for duration of the ping,
// and the distance result in inches and centimeters:
long duration, in, cm, height, percentage;       //'in' is inches and 'cm' is centimeter


void setup() {

}

void loop()
{ 


// The PING is triggered by a HIGH pulse of 2 or more microseconds.
// Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
pinMode(trig, OUTPUT);
digitalWrite(trig, LOW);
delayMicroseconds(2);
digitalWrite(trig, HIGH);
delayMicroseconds(5);
digitalWrite(trig, LOW);

// The same pin is used to read the signal from the PING: a HIGH
// pulse whose duration is the time (in microseconds) from the sending
// of the ping to the reception of its echo off of an object.
pinMode(echo, INPUT);
duration = pulseIn(echo, HIGH);

// Convert the time into a distance
in = microsecondsToInches(duration);
cm = microsecondsToCentimeters(duration);
height=d-cm;
percentage=height/d;

}

long microsecondsToInches(long microseconds)
{
// According to Parallax's datasheet for the PING, there are
// 73.746 microseconds per inch (i.e. sound travels at 1130 feet per
// second). This gives the distance travelled by the ping, outbound
// and return, so we divide by 2 to get the distance of the obstacle.
// See: http://www.parallax.com/dl/docs/prod/acc/28015-PI...
return microseconds / 74 / 2;
}

long microsecondsToCentimeters(long microseconds)
{
// The speed of sound is 340 m/s or 29 microseconds per centimeter.
// The ping travels out and back, so to find the distance of the
// object we take half of the distance travelled.
return microseconds / 29 / 2;
}