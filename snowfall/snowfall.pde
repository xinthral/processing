Snowflake[] points;
int density;
float gravity;

void setup() {
  density = 500;
  gravity = 0.03;
  //size(600, 600);
  fullScreen(0);
  background(0);
  points = new Snowflake[density];
  for (int i = 0; i < density; i++) {
    points[i] = new Snowflake();
  }
}

void draw() {
  background(0);
  for (Snowflake p : points) {
    p.update(gravity);
  }
}

void keyPressed() {
  switch(key) {
    case 'q':
      println("Quitting...");
      noLoop();
      exit();
      break;
    case 'p':
      println("Pausing...");
      delay(5000);
      break;
  }
}
