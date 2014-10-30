//liliControl v0.0.1

import oscP5.*;
import netP5.*;
import controlP5.*;

int nbLed = 192;

int R1= 0;
int G1= 0;
int B1= 0;

color color1 = color(R1, G1, B1);

int R2= 0;
int G2= 0;
int B2= 0;

color color2 = color(R2, G2, B2);

color white = color(255, 255, 255);
color black = color(0, 0, 0);
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);

OscP5 oscP5;
ControlP5 cp5;
NetAddress lili;

void setup() {
  size(140, 600);
  lili = new NetAddress("lili.local", 8000);
  oscP5 = new OscP5(this, 9000);
  cp5 = new ControlP5(this);
  // GUI
  cp5.addSlider("R1")
    .setPosition(20, 20)
      .setRange(0, 255)
        ;
  cp5.addSlider("G1")
    .setPosition(20, 40)
      .setRange(0, 255)
        ;
  cp5.addSlider("B1")
    .setPosition(20, 60)
      .setRange(0, 255)
        ;

  cp5.addSlider("R2")
    .setPosition(20, 110)
      .setRange(0, 255)
        ;
  cp5.addSlider("G2")
    .setPosition(20, 130)
      .setRange(0, 255)
        ;
  cp5.addSlider("B2")
    .setPosition(20, 150)
      .setRange(0, 255)
        ;

  cp5.addButton("alloff")
    .setValue(0)
      .setPosition(0, 180)
        .setSize(140, 20)
          ;
  cp5.addButton("fillColor1")
    .setValue(0)
      .setPosition(0, 200)
        .setSize(140, 20)
          ;

  cp5.addButton("fillColor2")
    .setValue(0)
      .setPosition(0, 220)
        .setSize(140, 20)
          ;

  cp5.addButton("gradient_A")
    .setValue(0)
      .setPosition(0, 240)
        .setSize(140, 20)
          ;
  cp5.addButton("gradient_B")
    .setValue(0)
      .setPosition(0, 260)
        .setSize(140, 20)
          ;
  println("liliControl -- START");
//  testPixelRGB();
}

void draw() {
  noStroke();
  fill(color1);
  rect(0, 0, 140, 90);
  fill(color2);
  rect(0, 90, 140, 90);
}

void R1(int theColor) {
  R1 = theColor;
  color1=color(R1, G1, B1);
}

void G1(int theColor) {
  G1 = theColor;
  color1=color(R1, G1, B1);
}

void B1(int theColor) {
  B1 = theColor;
  color1=color(R1, G1, B1);
}

void R2(int theColor) {
  R2 = theColor;
  color2=color(R2, G2, B2);
}

void G2(int theColor) {
  G2 = theColor;
  color2=color(R2, G2, B2);
}

void B2(int theColor) {
  B2 = theColor;
  color2=color(R2, G2, B2);
}
void alloff() {
  off();
}

void fillColor1() {
  fillColorRGB(color1);
}

void fillColor2() {
  fillColorRGB(color2);
}
void gradient_A() {
  gradientLinear(color1, color2, 192);
}
void gradient_B() {
  gradientTubular(color1, color2);
}

