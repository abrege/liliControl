// COLOR SHARE
int nbLed = 30;
int nbUsers =2;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress piPi;

void setup() {
  size(100, 100);
  piPi = new NetAddress("pipi.local", 8000);
  oscP5 = new OscP5(this, 12000);
  test(100);
}

void draw() {
}

void mousePressed() {
}

void keyPressed() {

  switch (key) {
  case 'r':
    randomColor();
    break;
  case 'b':
    blackOut();  
    break; 
  case 't':
    rgbTest();
    break;
  case 'l':
    firstLight();
    break;   
    
  default:  
    break;
  }
}

void sendColor(int p, int r, int g, int b) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage msg = new OscMessage("/rgb/");

  msg.add(p); /* add an int to the osc message */
  msg.add(r); /* add an int to the osc message */
  msg.add(g); /* add an int to the osc message */
  msg.add(b); /* add an int to the osc message */

  /* send the message */
  oscP5.send(msg, piPi);
}

void blackOut() {
  for (int i=0 ; i<nbLed ; i++) {
    sendColor(i, 0, 0, 0);
  }
}

void colorAll(int r, int g, int b, int d) {
  for (int i=0 ; i<nbLed ; i++) {
    sendColor(i, r, g, b);
    delay(d);
  }
}

void test(int x) {
  int D = x;
  int d = D/10;
  blackOut();  
  colorAll(255, 0, 0, d);
  delay(D);
  colorAll(0, 255, 0, d);
  delay(D);
  colorAll(0, 0, 255, d);
  delay(D);
  colorAll(255, 255, 255, d);
  delay(D*2);
  blackOut();
}

void randomColor() {
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));

  for (int i=0;i<nbLed;i++) {
    sendColor(i, r, g, b);
  }
  // background(r,g,b);
}

void rgbTest() {
  for (int i=0;i<nbLed;i+=3) {
    sendColor(i, 255, 0, 0);
  }
  for (int i=1;i<nbLed;i+=3) {
    sendColor(i, 0, 255, 0);
  }
  for (int i=2;i<nbLed;i+=3) {
    sendColor(i, 0, 0, 255);
  }
}

void firstLight() {
  for (int i=0;i<nbLed;i++) {   
    sendColor(i-1, 127, 127, 127);
    sendColor(i, 255, 255, 255);
    sendColor(i+1, 127, 127, 127);    
    delay(int(random(500)));
    blackOut();
  }
}


