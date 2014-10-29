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

void gradientRGB(color c1, color c2, int steps) {
  for (int i=0; i<steps; i++) {
    float amt = map(i, 0, steps, 0.0, 1.0);
    color resultColor = lerpColor(c1, c2, amt);
    pixelRGB(i, resultColor);
  }
}

void testPixel() {
  fillColorRGB(white);
  delay(2000);
  off();
  pixelRGB(10, red);
  pixelRGB(20, red);
  pixelRGB(30, red);
  pixelRGB(40, red);
  pixelRGB(50, red);
  pixelRGB(60, red);
  pixelRGB(70, red);
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

