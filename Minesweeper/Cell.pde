class Cell {
  int x = 0;
  int y = 0;
  int i = 0;
  int j = 0;
  int w = 0;
  boolean hidden = true;
  boolean clear = false;
  boolean safe = false;
  float safety = 0.90;
  int padding = 5;
  int adjacencyCount = 0;

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

  void display() {
    noFill();
    stroke(0);
    fill(250);
    if (!this.hidden) {
      // Only show if not hidden
      if (!this.safe) {
        // Draw Circle in unsafe Cell
        ellipseMode(CORNERS);
        fill(100);
        ellipse(this.x, this.y, this.x + (this.w - this.padding), this.y + (this.w - this.padding));
      } else {
        if (this.adjacencyCount == 0) {
          // Mark space as clear */*/
          this.clear = true;
          fill(200);
          square(this.x, this.y, this.w - this.padding);
        } else {
          // Mark warning track
          textAlign(CENTER);
          textSize(this.w * 0.9);
          text(" " + this.adjacencyCount, this.x + ((this.w - this.padding * 2) / 2), this.y + (this.w - this.padding * 2));
        }
      }
    } else {
      // If nothing else, space should remain hidden
      square(this.x, this.y, this.w - this.padding);
    }
  }
}
