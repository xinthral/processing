class Cell {
  float x, y;
  int scale;
  color c;
  boolean valid;
  char letter;
  
  Cell(float _x, float _y, int _scale, boolean _valid) {
    this.x = _x * _scale;
    this.y = _y * _scale;
    this.scale = _scale;
    this.c = this.randomColor();
    this.valid = _valid;
  }
  
  void invalidate() {
    this.valid = false;
  }
  
  color randomColor() {
    int r = floor(random(0, 255));
    int g = floor(random(0, 255));
    int b = floor(random(0, 255));
    float a = random(0, 255);
    return color(r, g, b, a); 
  }
  
  void reColor() {
    if (this.valid) {
      this.c = this.randomColor();
    } else {
      this.c = color(0, 0, 0, 0);
    }
  }
  
  void setLetter(char _letter) {
    this.letter = _letter;
    this.valid = true;
  }
}
