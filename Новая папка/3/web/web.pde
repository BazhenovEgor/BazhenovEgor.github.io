
int cols, rows;
int scl = 35;
int w = 600;
int h = 2400;

float flying = 0;

float[][] terrain;

void setup() {
  size(1366, 768, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
}


void draw() {

  flying -= 0.005;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, -400);
      xoff += 0.2;
    }
    yoff += 0.23;
  }



  background(25);
  stroke(40);
  noFill();

  translate(width/1.2, height/3+50);
  rotateX(PI/5);
  translate(-w/5, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
