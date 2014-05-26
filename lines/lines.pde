int w = 640;
int h = 480;
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
    p = p3;
  } else {
    PVector p1 = new PVector(p.x + path0.x, p.y + path0.y);
    PVector p2 = new PVector(p1.x + path1.x, p1.y + path1.y);
    PVector p3 = new PVector(p2.x + path0.x, p2.y + path0.y);
    PVector p4 = new PVector(p3.x + path1.x, p3.y + path1.y);
    line(p.x, p.y, p1.x, p1.y);
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p4.x, p4.y);
    p = p3;
  }
  // Rotate path vectors
  path0.rotate(QUARTER_PI);
  path1.rotate(QUARTER_PI);
  path2.rotate(QUARTER_PI);
  path3.rotate(QUARTER_PI);
}
