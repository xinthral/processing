Grid g;
int fr = 0;

void setup() {
  size(801, 601);
  //fullScreen(0);
  background(150);
  g = new Grid(20);
  frameRate(10);
}

void draw() {
  if (fr % 20 == 0) {
    g.reColor();
  }
  g.show();
  fr++;
}

void keyPressed() {
  switch(key) {
    case 'q':
      noLoop();
      exit();
      break;
    case 'p':
      println("Pausing...");
      delay(5000);
      break;
    case 'r':
      g.reColor();
      break;      
  }
}
