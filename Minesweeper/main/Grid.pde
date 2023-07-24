class Grid {
  int cols = 0;
  int rows = 0;
  int lost = 0;
  int w = 0;
  int padding = 0;
  Cell[][] matrix;
  ArrayList<Cell> queue;
  
  Grid(int _width, int _height, int _w, int _pad) {
    this.padding = _pad;
    this.w = _w;
    this.cols = _width/_w;
    this.rows = _height/_w;
    this.matrix = new Cell[this.cols][this.rows];
  }
  
  void build_matrix() {
    // Pass one: Builds Cells
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        int _x = i * (this.w + this.padding), _y = j * (this.w + this.padding);
        this.matrix[i][j] = new Cell(_x, _y, this.w, this.padding, i, j);
      }
    }
  }

  void build_finalization() {
    // Pass two: Setups up adjacencies
    int dangerCount;
    int[][] dir = new int[8][2];
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        dangerCount = 0;
        dir = new int[8][2];
        int _x = i * (this.w + this.padding), _y = j * (this.w + this.padding);
        // this.matrix[i][j] = new Cell(_x, _y, this.w, this.padding, i, j);

        // Cardinal Directions
        dir[0][0] = i - 1; dir[0][1] = j - 1;
        dir[1][0] = i - 1; dir[1][1] = j    ;
        dir[2][0] = i - 1; dir[2][1] = j + 1;
        dir[3][0] = i    ; dir[3][1] = j - 1;
        dir[4][0] = i    ; dir[4][1] = j + 1;
        dir[5][0] = i + 1; dir[5][1] = j - 1;
        dir[6][0] = i + 1; dir[6][1] = j    ;
        dir[7][0] = i + 1; dir[7][1] = j + 1;

        if (isInbounds(dir[0][0], dir[0][1]) && !this.matrix[dir[0][0]][dir[0][1]].isSafe()) { dangerCount += 1; }
        if (isInbounds(dir[1][0], dir[1][1]) && !this.matrix[dir[1][0]][dir[1][1]].isSafe()) { dangerCount += 1; }
        if (isInbounds(dir[2][0], dir[2][1]) && !this.matrix[dir[2][0]][dir[2][1]].isSafe()) { dangerCount += 1; }
        if (isInbounds(dir[3][0], dir[3][1]) && !this.matrix[dir[3][0]][dir[3][1]].isSafe()) { dangerCount += 1; }
        if (isInbounds(dir[4][0], dir[4][1]) && !this.matrix[dir[4][0]][dir[4][1]].isSafe()) { dangerCount += 1; }
        if (isInbounds(dir[5][0], dir[5][1]) && !this.matrix[dir[5][0]][dir[5][1]].isSafe()) { dangerCount += 1; }
        if (isInbounds(dir[6][0], dir[6][1]) && !this.matrix[dir[6][0]][dir[6][1]].isSafe()) { dangerCount += 1; }
        if (isInbounds(dir[7][0], dir[7][1]) && !this.matrix[dir[7][0]][dir[7][1]].isSafe()) { dangerCount += 1; }

        this.matrix[i][j].setDangerRating(dangerCount);

      }
    }
  }
  
  void display_matrix() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        this.matrix[i][j].display();
      }
    }
  }
  
  void reveal_all() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        this.matrix[i][j].update();
      }
    }
  }
  
  void reveal_waterfall(int _i, int _j) {
    // https://en.wikipedia.org/wiki/Flood_fill
    // If node not inbounds, return
    //if (_i < 0 || _i >= this. cols || _j < 0 || _j >= this.rows) { return; }
    //this.matrix[_i][_j].update();  // Update node
    //reveal_waterfall(_i + 1, _j);  // Floodfill south
    //reveal_waterfall(_i - 1, _j);  // Floodfill north
    //reveal_waterfall(_i, _j - 1);  // Floodfill west
    //reveal_waterfall(_i, _j + 1);  // Floodfill east
    //return;
    int[] n = new int[2];
    int[] e = new int[2];
    int[] w = new int[2];
    int[] s = new int[2];
    Cell c, cn, ce, cw, cs;
    queue = new ArrayList<Cell>();           // 1. Set Q to the empty queue or stack.
    queue.add(this.matrix[_i][_j]);          // 2. Add node to the end of Q.
    while (!queue.isEmpty()) {               // 3. While Q is not empty:
      c = queue.get(0);                      // 4. Set n equal to the first element of Q.
      queue.remove(0);                       // 5. Remove first element from Q.
      println("Updating: ", c.i, c.j);
      n = new int[]{c.i - 1, c.j};
      e = new int[]{c.i + 1, c.j};
      w = new int[]{c.i, c.j - 1};
      s = new int[]{c.i, c.j + 1};
      if (isInbounds(c.i, c.j) && c.isSafe()) {            // 6. If n is Inside:
        c.update();
        if (isInbounds(n[0], n[1])) {
          cn = this.matrix[n[0]][n[1]];
          if (cn.hidden && !queue.contains(cn)) { queue.add(cn); }
        }
        if (isInbounds(e[0], e[1])) {
          ce = this.matrix[e[0]][e[1]];
          if (ce.hidden && !queue.contains(ce)) { queue.add(ce); }
        }
        if (isInbounds(w[0], w[1])) {
          cw = this.matrix[w[0]][w[1]];
          if (cw.hidden && !queue.contains(cw)) { queue.add(cw); }
        }
        if (isInbounds(s[0], s[1])) {
          cs = this.matrix[s[0]][s[1]];
          if (cs.hidden && !queue.contains(cs)) { queue.add(cs); }
        }
      }
    }
    return;
  }
  
  boolean isInbounds(int _i, int _j) {
    return (_i >= 0 && _i < this.cols && _j >=0 && _j < this.rows);
  }
}
