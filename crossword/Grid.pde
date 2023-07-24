class Grid {
  int h, w, scale, ylim, xlim, wordCount;
  Cell[][] matrix;
  Dictionary dict;
  
  Grid(int _scale) {
    this.h = height;
    this.w = width;
    this.scale = _scale;
    this.wordCount = 3;
    xlim = floor(this.w/this.scale);
    ylim = floor(this.h/this.scale);
    matrix = new Cell[xlim][ylim];
    dict = new Dictionary();
    this.buildGrid();
    this.buildMesh();
  }
  
  void buildGrid() {
    // Build Grid
    for (int i = 0; i < xlim; i++) {
      for (int j = 0; j < ylim; j++) {
        matrix[i][j] = new Cell(i, j, this.scale, false);
      }
    }
  }
  
  void buildMesh() {
    for (int i = 0; i < this.wordCount; i++) {
      // Select Word from dictionary
      String word = dict.getWord();
      
      // Select Location to start word
      int _x = floor(random(xlim));
      int _y = floor(random(ylim));
      PVector v = new PVector(_x, _y);
      char _dir = (random(1) > 0.5) ? 'v' : 'h';
      
      // Check for valid path for word
      if (isPositionValid(v, word.length(), _dir)) {
        for (char l : word.toCharArray()) {
          // Assign letter to Cell
          matrix[_x][_y].setLetter(l);
          if (_dir == 'v') { _y += 1; }
          if (_dir == 'h') { _x += 1; }
        }
      }
    }
  }
  
  boolean isPositionValid(PVector root, int len, char orientation) {
    if (orientation == 'h') {
      if (root.x + len < xlim) { return true; }  
    }
    if (orientation == 'v') {
      if (root.y + len < ylim) { return true; }
    }
    return false;
  }
  
  void reColor() {
    for (int i = 0; i < xlim; i++) {
      for (int j = 0; j < ylim; j++) {
        matrix[i][j].reColor();
      }
    }
  }
  
  void show() {
    //rectMode(CENTER);
    Cell c;
    for (int i = 0; i < xlim; i++) {
      for (int j = 0; j < ylim; j++) {
        c = matrix[i][j];
        if (c.valid) {
          //fill(color(150, 150, 150, 0.1));
          noFill();
          textSize(this.scale);
          text(c.letter, c.x, c.y);
        } else {
          //fill(c.c);
          noFill();
        }
        rect(c.x, c.y, this.scale, this.scale);
      }
    }
  }
}
