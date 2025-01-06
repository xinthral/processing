class Grid {
  int cols = 0;
  int rows = 0;
  int padd = 0;   // cell padding
  int hsize = 0;   // cell size horizontal
  int vsize = 0;   // cell size vertial
  Cell[][] matrix;
  ArrayList<Cell> queue;

  Grid(int rows, int columns) {
    this.cols = columns;
    this.rows = rows;
    this.padd = 2;
    this.build();
  }

  void build() {
    this.cellSize();
    this.matrix = new Cell[this.cols][this.rows];
    queue = new ArrayList<Cell>();
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0 ; j < this.cols; j++) {
        this.matrix[i][j] = new Cell(i, j);
      }
    }
  }

  void cellSize() {
    //this.hsize = round((width / this.cols) + this.padd);
    //this.vsize = round((height / this.rows) + this.padd);
    this.hsize = (width - (this.cols - 1) * this.padd) / this.cols;
    this.vsize = (height - (this.rows - 1) * this.padd) / this.rows;
  }

  void draw() {
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        if (this.matrix[i][j].isOccupied()) { noFill(); }
        else { fill(200, 200, 200); }
        float x = j * (this.hsize + this.padd);
        float y = i * (this.vsize + this.padd);
        rect(x, y, this.hsize, this.vsize);
      }
    }
  }

  void reset() {
    this.build();
  }
}
