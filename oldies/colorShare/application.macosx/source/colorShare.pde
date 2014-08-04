// COLOR SHARE

//import android.view.inputmethod.InputMethodManager;
//import android.content.Context;

import oscP5.*;
import netP5.*;

int nbLed = 30;

OscP5 oscP5;
NetAddress piPi;

void setup() {
  size(100, 100);

  piPi = new NetAddress("192.168.0.14", 8000);
  oscP5 = new OscP5(this, 12000);
  test(1000);
  //showVirtualKeyboard();
}

void draw() {
}

void mousePressed() {
  randomColor();
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
  case 'g':  
    gradient(#FF0000, #00FF00);
    break;     
  default:  
    break;
  }
}

