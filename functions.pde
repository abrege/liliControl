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

void pixel(int p, int r, int g, int b) {
  OscMessage pixel = new OscMessage("/pixel");
  pixel.add(p);
  pixel.add(r);
  pixel.add(g);
  pixel.add(b);
  oscP5.send(pixel, lili);
  update();
}

void fillTest(int d, int it) {
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
}


