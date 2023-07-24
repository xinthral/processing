int cellSize = 32;
int padding = 2;

Grid grid = new Grid(680, 680, cellSize, padding);

void setup() {
  size(680, 680);
  grid.reset();
  frameRate(10);
}

void draw() {
  background(0);
  grid.display();
  if (mousePressed && frameCount % 5 == 0) {
    int mx = mouseX;
    int my = mouseY;
    
    mx /= cellSize;
    my /= cellSize;
    //println("X/Y: ", mx, my);
    if (grid.matrix[mx][my].safe == false) {
      grid.revealAll();
    } else {
      grid.reveal(mx, my);  
    }
  }
}

void keyPressed() {
  switch(key) {
    case 'q':
      noLoop();
      exit();
      break;
    case 'p':
      delay(5000);
      break;
    case 'r':
      grid.reset();
      break;
  }
}
