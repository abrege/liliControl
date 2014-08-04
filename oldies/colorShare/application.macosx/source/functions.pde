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

void sendColor2(int p, color rgb) {
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


void blackOut() {
  for (int i=0 ; i<nbLed ; i++) {
    sendColor2(i, #000000);
  }
}

void colorAll(int r, int g, int b, int d) {
  for (int i=0 ; i<nbLed ; i++) {
    sendColor2(i, color(r, g, b));
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
  background(r, g, b);
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

void gradient(color c1, color c2) {
  for (int i=0;i<nbLed;i++) {
    float amt = map(i, 0, nbLed, 0.0, 1.0);
    color resultColor = lerpColor(c1, c2, amt);
    sendColor2(i, resultColor);
  }
}


