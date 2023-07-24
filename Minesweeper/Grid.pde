class Grid {
  int cols = 0;
  int rows = 0;
  int lost = 0;
  int w = 0;
  int padding = 0;
  Cell[][] matrix;
  ArrayList<Cell> queue = new ArrayList<Cell>();

  Grid(int _width, int _height, int _w, int _pad) {
    this.padding = _pad;
    this.w = _w;
    this.cols = _width/_w;
    this.rows = _height/_w;
    this.matrix = new Cell[this.cols][this.rows];
  }

  void build() {
    for(int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        this.matrix[i][j] = new Cell(i*this.w+this.padding, j*this.w+this.padding, this.w, this.padding, i, j);
      }
    }
  }

  void process() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        if (this.matrix[i][j].safe) {
          for (int x = -1; x <= 1; x++) {
            for (int y = -1; y <= 1; y++) {
              if ((i + x) >= 0 && (i + x) < this.cols && (j + y) < this.rows && (j + y) >= 0) {
                if (!this.matrix[i + x][j + y].safe) {
                  this.matrix[i][j].adjacencyCount += 1;
                }
              }
            }
          }
        }
      }
    }
  }

  void display() {
    Cell cell;
    for(int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        cell = this.matrix[i][j];
        cell.display();
        if (cell.clear) { this.waterFall(cell); }
      }
    }
  }

  boolean inbounds(Cell cell) {
    return (cell.x > 0 && cell.x < width && cell.y > 0 && cell.y < height);
  }

  void reset() {
    this.build();
    this.process();
  }

  void reveal(int i, int j) {
    this.matrix[i][j].hidden = false;
  }

  void revealAll() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        this.reveal(i, j);
      }
    }
  }
  
  boolean valid(int i, int j) {
    if (i < 0 || i >= this.cols || j < 0 || j >= this.rows) { return false; }
    if (this.matrix[i][j].hidden || !this.matrix[i][j].clear) { return false; }
    return true;      
  }

  void waterFall(Cell cell) {
    int _i, _j;
    Cell newCell;
    this.queue.add(cell);
        
    while (this.queue.size() > 0) {
      newCell = this.queue.get(this.queue.size()-1);

      this.queue.remove(this.queue.size()-1);
      println(this.queue.size());

      _i = newCell.i + 1;
      _j = newCell.j;
      
      if (valid(_i, _j)) {
        this.reveal(_i, _j);
        if (isPending(this.matrix[_i][_j])) {
          println("Cell: x(" + _i + ") y(" + _j + ")");
          this.queue.add(this.matrix[_i][_j]);
        }
      }     
      
      _i = newCell.i - 1;
      _j = newCell.j;
      if (valid(_i, _j)) {
        this.reveal(_i, _j);
        if (isPending(this.matrix[_i][_j])) {
          println("Cell: x(" + _i + ") y(" + _j + ")");
          this.queue.add(this.matrix[_i][_j]);
        }
      }
      
      _i = newCell.i;
      _j = newCell.j + 1;
      
      if (valid(_i, _j)) {
        this.reveal(_i, _j);
        if (isPending(this.matrix[_i][_j])) {
          println("Cell: x(" + _i + ") y(" + _j + ")");
          this.queue.add(this.matrix[_i][_j]);
        }      
      }
      
      _i = newCell.i;
      _j = newCell.j - 1;
      if (valid(_i, _j)) {
        this.reveal(_i, _j);
        if (isPending(this.matrix[_i][_j])) {
          println("Cell: x(" + _i + ") y(" + _j + ")");
          this.queue.add(this.matrix[_i][_j]);
        }
      }
    }    
  }
  
  boolean isPending(Cell cell) {
    for (int i = 0; i < this.queue.size() - 1; i++) {
      if (this.queue.get(i) == cell) { return true; }
    }
    return false;
  }
}
