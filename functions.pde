void off() {
  OscMessage off = new OscMessage("/off");
  oscP5.send(off, lili);
}

void update() {
  OscMessage up = new OscMessage("/update");
  oscP5.send(up, lili);
}

void fillColor(int r, int g, int b) {
  OscMessage fill = new OscMessage("/fill");
  fill.add(r);
  fill.add(g);
  fill.add(b);
  oscP5.send(fill, lili);
}

void fillColorRGB(color rgb) {
  OscMessage fill = new OscMessage("/fill");
  int r = (rgb >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (rgb >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = rgb & 0xFF;          // Faster way of getting blue(argb)

  fill.add(r);
  fill.add(g);
  fill.add(b);

  println("All pixels colored in r=" + r + ", g=" + g + ", b=" + b + ".");

  oscP5.send(fill, lili);
}


void pixel(int p, int r, int g, int b) {
  OscMessage pixel = new OscMessage("/pixel");
  pixel.add(p);
  pixel.add(r);
  pixel.add(g);
  pixel.add(b);
  oscP5.send(pixel, lili);
}

void pixelRGB(int p, color c) {
  OscMessage pixel = new OscMessage("/pixel");

  int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = c & 0xFF;          // Faster way of getting blue(argb)

  pixel.add(p);
  pixel.add(r);
  pixel.add(g);
  pixel.add(b);

  println("Pixel " + p + " colored in r=" + r + ", g=" + g + ", b=" + b + ".");
  oscP5.send(pixel, lili);
}

void gradientLinear(color c1, color c2, int steps) {
  for (int i=0; i<steps; i++) {
    float amt = map(i, 0, steps, 0.0, 1.0);
    color resultColor = lerpColor(c1, c2, amt);
    pixelRGB(i, resultColor);
  }
  update();
}

void gradientTubular(color c1, color c2) {
  for (int i=0; i<48; i++) {
    float amt = map(i, 0, 48, 0.0, 1.0);
    color resultColor = lerpColor(c1, c2, amt);
    pixelRGB(i, resultColor);
  }
  for (int i=48; i<95; i++) {
    float amt = map(i, 95, 48, 0.0, 1.0);
    color resultColor = lerpColor(c1, c2, amt);
    pixelRGB(i, resultColor);
  }
    for (int i=95; i<144; i++) {
    float amt = map(i, 95, 144, 0.0, 1.0);
    color resultColor = lerpColor(c1, c2, amt);
    pixelRGB(i, resultColor);
  }
    for (int i=144; i<192; i++) {
    float amt = map(i, 192, 144, 0.0, 1.0);
    color resultColor = lerpColor(c1, c2, amt);
    pixelRGB(i, resultColor);
  }  

  update();
}
void testPixelRGB() {
  for (int i=0; i<192; i++) {
    pixelRGB(i, color(255, 255, 255));
    if (8<i)
      pixelRGB(i-8, color(0, 0, 0));
    else
      pixelRGB(192-i, color(255, 255, 255));
    update();
  }
}

void testFill(int d, int it) {
  for (int i=0; i < it; i++) {
    fillColor(255, 0, 0);
    delay(d);
    fillColor(0, 255, 0);
    delay(d);
    fillColor(0, 0, 255);
    delay(d);
    fillColor(255, 255, 255);
    delay(d);
  }
  off();
}

boolean run = false;
void pulseTest() {
  int startColor = 0;
  int endColor = 255;
  int d = 0;

  while (run == true) {

    for (int i=startColor; i<=endColor; i+=10) {
      fillColor(i, i, i);
      delay(d);
    }

    for (int i=endColor; i>=startColor; i-=10  ) {
      fillColor(i, i, i);
      delay(d);
    }
    off();
  }
}

