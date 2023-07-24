int cellSize = 32;
int padding = 2;
boolean gameOver = false;
boolean helpFlag = false;
Grid grid = new Grid(680, 680, cellSize, padding);

void setup() {
  size(680, 680, P3D);
  grid.build_matrix();
  frameRate(10);
}

void draw() {
  noStroke();
  background(0);
  grid.display_matrix();
  if (gameOver) { gameOver(); }
  if (helpFlag) {
    colorMode(RGB);
    stroke(200, 200, 0);
    textSize(100);
    text("Help", 60, 120, 10);
  }
  if (mousePressed && frameCount % 1 == 0) {
    int mx = mouseX / (cellSize + padding);
    int my = mouseY / (cellSize + padding);
    
    println("X/Y: ", mx, my);
    //rect(mouseX, mouseY, cellSize, cellSize);

    Cell c = grid.matrix[mx][my];
    if (!c.update()) { gameOver = true; }
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
      int mx = mouseX / (cellSize + padding);
      int my = mouseY / (cellSize + padding);      
      grid.reveal_waterfall(mx, my);
      break;
    case 'h':
      helpFlag = (helpFlag) ? false : true;
      println("Printed Text");
      break;
  }
}

void gameOver() {
  println("Hit a trap");
  noLoop();
  grid.reveal_all();
  grid.display_matrix();
}
