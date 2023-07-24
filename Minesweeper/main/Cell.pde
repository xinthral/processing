class Cell {
  int x = 0;
  int y = 0;
  int i = 0;
  int j = 0;
  int w = 0;
  boolean hidden = true;
  // boolean clear = false;
  boolean safe = false;
  float safety = 0.95;
  int padding = 5;
  int danger = 0;
  int colour = 255;

  Cell(int _x, int _y, int _w, int _p, int _i, int _j) {
    this.i = _i;
    this.j = _j;
    this.padding = _p;
    this.x = _x;
    this.y = _y;
    this.w = _w;
    if (random(1) <= this.safety) {
      this.safe = true;
    }
  }
  
  int getX() { return this.x; }
  int getY() { return this.y; }
  boolean isSafe() { return this.safe; }
  int[] getLocation() { return new int[]{getX(), getY()}; }
  void setDangerRating(int _count) { this.danger = _count; }
  int dangerCount() { return this.danger; }
  
  void display() {
    fill(this.colour);
    int _x = this.x + this.padding / 2;
    int _y = this.y + this.padding / 2;
    int _size = this.w - this.padding / 2;
    rect(_x, _y, _size, _size);
    noFill();
  }

  void showLabel() {
    if (this.danger > 0) {
      noStroke();
      textSize(this.w / 2);
      text(this.danger, this.x, this.y);
    }
  }
  
  boolean update() {
    this.hidden = false;
    this.showLabel();
    if (this.safe == true) { this.colour = 200; } 
    else { this.colour = 0; }
    return (this.safe);
  }
}
