int resolution = 40;
int cols;
int rows;
int[][] grid;

void setup() {
  size(400, 400);
  int cols = width / resolution;
  int rows = height / resolution;
  
  grid = new int[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = (int) floor(random(2));
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * resolution;
      int y = j * resolution;
      if (grid[i][j] == 1) {
        fill(150);
        square(x, y, resolution);
      }
    }
  }
}
