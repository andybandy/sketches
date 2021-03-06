int w = 800;
int h = 600;
int frame = 0;
int c = 0;
int s = 20;
PVector p;
// Path
PVector path0 = new PVector(0, -s);
PVector path1 = new PVector(s, 0);
PVector path2 = new PVector(s, 0);
PVector path3 = new PVector(0, -s);

void setup() {
  size(w, h);
  background(0);
  p = new PVector(floor(w*0.5), floor(h*0.5));
  stroke(100);
  strokeWeight(1);
}

void draw() {
  ++frame;
  ++c;
  if (c > 255) {
    c = 0;
  }
  color clr = color(c, map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 255));
  // stroke(clr);
  stroke(c);
  if (frame%2 == 0) {
    PVector p1 = new PVector(p.x + path0.x, p.y + path0.y);
    PVector p2 = new PVector(p1.x + path1.x, p1.y + path1.y);
    PVector p3 = new PVector(p2.x + path2.x, p2.y + path2.y);
    PVector p4 = new PVector(p3.x + path3.x, p3.y + path3.y);
    line(p.x, p.y, p1.x, p1.y);
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p4.x, p4.y);
    p = p4;
  } else {
    PVector p1 = new PVector(p.x + path0.x, p.y + path0.y);
    PVector p2 = new PVector(p1.x + path1.x, p1.y + path1.y);
    PVector p3 = new PVector(p2.x + path0.x, p2.y + path0.y);
    PVector p4 = new PVector(p3.x + path1.x, p3.y + path1.y);
    line(p.x, p.y, p1.x, p1.y);
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p4.x, p4.y);
    p = p4;
  }
  if (p.x > width) {
    p.x = 0;
  }
  if (p.x < 0) {
    p.x = width;
  }
  if (p.y > height) {
    p.y = 0;
  }
  if (p.y < 0) {
    p.y = height;
  }
  // Rotate path vectors
  if (random(0.7) > 0.5) {
    path0.rotate(QUARTER_PI);
  }
  if (random(0.7) > 0.4) {
    path1.rotate(QUARTER_PI);
  }
  if (random(0.7) > 0.5) {
    path2.rotate(QUARTER_PI);
  }
  if (random(0.7) > 0.4) {
    path3.rotate(QUARTER_PI);
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen.png");
  }
}
