//liliControl v0.0.1

import oscP5.*;
import netP5.*;

int nbLed = 192;

OscP5 oscP5;
NetAddress lili;

void setup() {
  size(100, 100);
  lili = new NetAddress("lili.local", 8000);
  oscP5 = new OscP5(this, 9000);

  // test procedure
  off();
  //fillTest(1000,3);
  //off();

  //pulse();
  // testPixel();
}
void draw() {

  //pulse();
}


void keyPressed() {

  switch (key) {
  case 'a':
    fillTest(100, 1);
    break;
  case 'z':
    pulse();  
    break; 
  case 'e':
    testPixel();
    break;
  default:  
    break;
  }
}

