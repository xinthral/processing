class Cell {
  int posy;
  int posx;
  boolean occupied;

  Cell(int i, int j) {
    this.posy = i;
    this.posx = j;
    occupied = random(0, 1) > 0.1;
  }

  boolean isOccupied() {
    return this.occupied;
  }
}
