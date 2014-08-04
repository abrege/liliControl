import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class colorShare extends PApplet {

// COLOR SHARE

//import android.view.inputmethod.InputMethodManager;
//import android.content.Context;




int nbLed = 30;

OscP5 oscP5;
NetAddress piPi;

public void setup() {
  size(100, 100);

  piPi = new NetAddress("192.168.0.14", 8000);
  oscP5 = new OscP5(this, 12000);
  test(1000);
  //showVirtualKeyboard();
}

public void draw() {
}

public void mousePressed() {
  randomColor();
}

public void keyPressed() {

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
    gradient(0xffFF0000, 0xff00FF00);
    break;     
  default:  
    break;
  }
}

public void sendColor(int p, int r, int g, int b) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage msg = new OscMessage("/rgb/");

  msg.add(p); /* add an int to the osc message */
  msg.add(r); /* add an int to the osc message */
  msg.add(g); /* add an int to the osc message */
  msg.add(b); /* add an int to the osc message */

  /* send the message */
  oscP5.send(msg, piPi);
}

public void sendColor2(int p, int rgb) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage msg = new OscMessage("/rgb/");

  int r = (rgb >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (rgb >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = rgb & 0xFF;          // Faster way of getting blue(argb)

  msg.add(p); /* add an int to the osc message */
  msg.add(r); /* add an int to the osc message */
  msg.add(g); /* add an int to the osc message */
  msg.add(b); /* add an int to the osc message */

  /* send the message */
  oscP5.send(msg, piPi);
}


public void blackOut() {
  for (int i=0 ; i<nbLed ; i++) {
    sendColor2(i, 0xff000000);
  }
}

public void colorAll(int r, int g, int b, int d) {
  for (int i=0 ; i<nbLed ; i++) {
    sendColor2(i, color(r, g, b));
    delay(d);
  }
}

public void test(int x) {
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

public void randomColor() {
  int r = PApplet.parseInt(random(256));
  int g = PApplet.parseInt(random(256));
  int b = PApplet.parseInt(random(256));

  for (int i=0;i<nbLed;i++) {
    sendColor(i, r, g, b);
  }
  background(r, g, b);
}

public void rgbTest() {
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

public void firstLight() {
  for (int i=0;i<nbLed;i++) {   
    sendColor(i-1, 127, 127, 127);
    sendColor(i, 255, 255, 255);
    sendColor(i+1, 127, 127, 127);    
    delay(PApplet.parseInt(random(500)));
    blackOut();
  }
}

public void gradient(int c1, int c2) {
  for (int i=0;i<nbLed;i++) {
    float amt = map(i, 0, nbLed, 0.0f, 1.0f);
    int resultColor = lerpColor(c1, c2, amt);
    sendColor2(i, resultColor);
  }
}


/*
void showVirtualKeyboard() 
{
  InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
  imm.toggleSoftInput(InputMethodManager.SHOW_FORCED,0);
}

*/
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "colorShare" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
