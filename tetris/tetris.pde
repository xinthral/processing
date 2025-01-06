Grid grid;
int cols = 10;
int rows = 10;

void setup() {
  size(800,680);
  grid = new Grid(cols, rows);
  frameRate(10);
}

void draw() {
  background(255);
  grid.draw();

  if (mousePressed && frameCount % 5 == 0) {
    int mx = mouseX;
    int my = mouseY;
    
    mx /= grid.hsize + grid.padd;
    my /= grid.vsize + grid.padd;

    //if (!grid.matrix[mx][my].isOccupied()) {
    if (mx >= 0 && mx < cols && my >= 0 && my < rows) {
      println("Grid matrix: " + mx + " " + my);  
    }
  }
}

void keyPressed() {
  switch(key) {
    case 'q':
      println("Quitting per user request...");
      noLoop();
      exit();
      break;
    case 'p':
      println("Pausing per user request...");
      delay(5000);
      break;
    case 'r':
      println("Resetting per user request...");
      grid.reset();
      break;
  }
}
