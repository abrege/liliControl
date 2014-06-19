//liliControl v0.0.1

import oscP5.*;
import netP5.*;

int nbLed = 192;

OscP5 oscP5;
NetAddress lili;

void setup() {
  size(100, 100);
  lili = new NetAddress("192.168.0.29", 8000);
  oscP5 = new OscP5(this, 9000);
  
  // test procedure
  off();
  fillTest(500,1);
  off();
  
 // pulse();

}
void draw() {
  
  pulse();
}
