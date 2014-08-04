// COLOR SHARE


import oscP5.*;
import netP5.*;

int nbLed = 192;

OscP5 oscP5;
NetAddress piPi;

void setup() {
  size(100, 100);

  piPi = new NetAddress("255.255.255.255", 8000);
  oscP5 = new OscP5(this, 9000);
  //test(1000);
  //  showVirtualKeyboard();
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
    gradient(#FF0000, #00FF00, nbLed);
    break;
  case 'h':  
    gradient(#FF0000, #FFFFFF, nbLed);
    break;    
  case 'j':  
    gradient(#FF0000 , #0000FF, nbLed);
    break;     
  case 'k':
  
    for(int i=0; i<256; i++){
    colorAll(i,i,i,0);
  }
    break;   
  default:  
    break;
  }
}

