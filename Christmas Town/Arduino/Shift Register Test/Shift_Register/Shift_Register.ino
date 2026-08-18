

#include <ESP8266WebServer.h>
#include <ESP8266WiFiGratuitous.h>
#include <WiFiServerSecure.h>
#include <WiFiClientSecure.h>
#include <WiFiClientSecureBearSSL.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <WiFiUdp.h>
#include <ESP8266WiFiType.h>
#include <CertStoreBearSSL.h>
#include <ESP8266WiFiAP.h>
#include <WiFiClient.h>
#include <BearSSLHelpers.h>
#include <WiFiServer.h>
#include <ESP8266WiFiScan.h>
#include <WiFiServerSecureBearSSL.h>
#include <ESP8266WiFiGeneric.h>
#include <ESP8266WiFiSTA.h>
#include <WiFiClientSecureAxTLS.h>
#include <WiFiServerSecureAxTLS.h>

// Wifi setup
const char* ssid     = "ostmo";
const char* password = "stikaa11";
int serverPort = 80;
int status = WL_IDLE_STATUS;
IPAddress ip;
ESP8266WebServer server( serverPort );

// Shift register setup
int latchPin = 15; // pin D8 on NodeMCU boards
int clockPin = 14; // pin D5 on NodeMCU boards
int dataPin = 13;  // pin D7 on NodeMCU
int outputEnablePin = 12;  // Pin D6

// Runtime variables
byte leds = 0;
long randNumber;
int delayInterval = 333;
int staticValue = 255;

void setup() 
{
  Serial.begin( 57600 );
  randomSeed( analogRead( 0 ) );
  // Set all the pins of 74HC595 as OUTPUT
  pinMode( latchPin, OUTPUT );
  pinMode( dataPin, OUTPUT );  
  pinMode( clockPin, OUTPUT );
  pinMode( outputEnablePin, OUTPUT );

  connectToWifi();

  // Start the web server and get ready to handle incoming requests
  startWebServer();
}

void loop() 
{

  // Listen for API requests
//  server.handleClient();
  
  // Each light in order
//  serialLoop();
  
  // Count from 0 - 255 in binary
//  binaryLoop();

  // Christmas tree pattern - pick a random pattern (15 - 127), + keep the light at 128 always on
  christmasLoop();

  // Always-on constant value
//  staticLoop();

}

void staticDisplay() {

  Serial.println( "Display " + staticValue );
  digitalWrite( latchPin, LOW );
  shiftOut( dataPin, clockPin, MSBFIRST, staticValue );
  digitalWrite( latchPin, HIGH );
}

void christmasLoop() {

  randNumber = random( 15, 128 );
  digitalWrite( latchPin, LOW );
  shiftOut( dataPin, clockPin, MSBFIRST, ((int)randNumber + (int)128) );
  digitalWrite( latchPin, HIGH );
  delay( delayInterval );
}

void binaryLoop() {
  // count from 0 to 255 and display the number on the LEDs
  for( int numberToDisplay = 0; numberToDisplay < 255; numberToDisplay++ ) {
    // take the latchPin low so the LEDs don't change while you're sending in bits:
    digitalWrite( latchPin, LOW );
    // shift out the bits:
    shiftOut( dataPin, clockPin, MSBFIRST, numberToDisplay );
    //take the latch pin high so the LEDs will light up:
    digitalWrite( latchPin, HIGH );
    // pause before next value:
    delay( delayInterval );
  }
}

void serialLoop()
{
  setBrightness( 255 );
  // Initially turns all the LEDs off, by giving the variable 'leds' the value 0
  leds = 0;
  updateShiftRegister();
  delay( delayInterval );
  // Turn all the LEDs ON one by one.
  for( int i = 0; i < 8; i++)
  {
    // Set the bit that controls that LED in the variable 'leds'
    bitSet( leds, (int)i );
    updateShiftRegister();
    delay( delayInterval );
  }
//  for (byte b = 255; b > 0; b--)
//  {
//    Serial.println( (int)b  );
//    setBrightness( b );
//    delay( 50 );
//  }

}

/*
 * updateShiftRegister() - This function sets the latchPin to low, then calls the Arduino function 
 * 'shiftOut' to shift out contents of variable 'leds' in the shift register before putting the 'latchPin' high again.
 */
void updateShiftRegister()
{
   digitalWrite( latchPin, LOW );
   shiftOut( dataPin, clockPin, LSBFIRST, leds );
   digitalWrite( latchPin, HIGH );
}

// 0 to 255
void setBrightness( byte brightness )
{
  analogWrite( outputEnablePin, 255 - (int)brightness );
}

/**
 * Define the endpoints for a tiny API server for receiving and handling requests and start the web server
 * 
 * @return void
 * @author costmo
 * @since  20180902
 */
void startWebServer()
{
//  server.on( "/", handleRoot );
  server.on( "/set", handleOutput );
  server.begin();
}

/**
 * Produce output based on user input
 */
void handleOutput() {
  // Params
  // p = pattern
  // n = specific number to turn on/off
  // d = delay

  String pattern = server.arg( "p" );
  String numberString = server.arg( "n" );
  int number = numberString.toInt();
  int delay = server.arg( "d" ).toInt();

  if( delay < 1 ) {
    delay = 333;
  }

  Serial.println( "P: " + pattern );
  Serial.println( "N: " + number );
  Serial.print( "D: " );
  Serial.println( delay );

  // Handle pattern requests
  if( NULL != pattern && pattern.length() > 0 ) {

    delayInterval = delay;
    if( pattern.equals( "christmas" ) ) {
      christmasLoop();
    } else if( pattern.equals( "binary" ) ) {
      binaryLoop();
    } else if( pattern.equals( "serial" ) ) {
      serialLoop();
    } else {
      server.send( 500, "text/html", "Unknown pattern" );
      return;
    }
    server.send( 200, "text/html", "ok" );
  } else {
    pattern = "none";
    if( NULL == numberString || numberString.length() < 1 ) {
      server.send( 500, "text/html", "I need either a pattern or a number" );
      return;
    }
  }

  if( pattern.equals( "none" ) ) {
    staticValue = number;
    staticDisplay();
  }

  server.send( 200, "text/html", "ok" );
}

void connectToWifi()
{
  Serial.print( "Connecting to " );
  Serial.println( ssid );

  WiFi.mode( WIFI_STA );
  WiFi.begin( ssid, password );

  while( WiFi.status() != WL_CONNECTED )
  {
      delay( 500 );
      Serial.print( "." );
  }
  Serial.println( "." );
  Serial.println( "Connected" );
  printWifiStatus();
}

void printWifiStatus() 
{
  // print the SSID of the network you're attached to:
//  Serial.print( "SSID: " );
//  Serial.println( WiFi.SSID() );

  // print your WiFi shield's IP address:
  ip = WiFi.localIP();
  Serial.print( "IP Address: " );
  Serial.println( ip );

  // print the received signal strength:
//  long rssi = WiFi.RSSI();
//  Serial.print( "Signal strength (RSSI):" );
//  Serial.print( rssi );
//  Serial.println (" dBm" );
}
