//liliControl v0.0.1

import oscP5.*;
import netP5.*;
import controlP5.*;

int nbLed = 192;

int R= 128;
int G= 128;
int B= 128;

OscP5 oscP5;
ControlP5 cp5;
NetAddress lili;

void setup() {
  size(100, 100);
  lili = new NetAddress("lili.local", 8000);
  oscP5 = new OscP5(this, 9000);
  cp5 = new ControlP5(this);
  
  // GUI
    cp5.addSlider("R")
     .setPosition(0,0)
     .setRange(0,255)
     ;
       cp5.addSlider("G")
     .setPosition(0,20)
     .setRange(0,255)
     ;
       cp5.addSlider("B")
     .setPosition(0,40)
     .setRange(0,255)
     ;
}

void draw() {
    background(R,G,B);

  //pulse();
}

void R(int theColor) {
  R = theColor;
  fillColor(R,G,B);
}

void G(int theColor) {
  G = theColor;
  fillColor(R,G,B);
}
void B(int theColor) {
  B = theColor;
  fillColor(R,G,B);
}

void keyPressed() {
  }


