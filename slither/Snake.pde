//import java.util.Iterator;

class Snake {
  char dir;
  char[] directions = {'n', 'e', 's', 'w'};
  color c = color(0, 0, 255);
  float speed = 1;
  int count = 0, max = 100, scale = 10;
  PVector head;
  ArrayList<PVector> path = new ArrayList<PVector>();
  
  Snake() {
    float _x = floor(random(0, width/this.scale)) * this.scale;
    float _y = floor(random(0, height/this.scale)) * this.scale;
    this.head = new PVector(_x, _y);
    this.dir = this.directions[floor(random(0, 3))];
  }
  
  int constrain(float cur, int min, int max) {
    int response = floor(cur);
    if (cur > max) { response = max; }
    if (cur < min) { response = min; }    
    return response;
  }
  
  void grow() {
    this.count += 1;
  }
  
  void move(char _dir) {
    
    /* Check If move is direction is valid */
    boolean valid = false;
    switch(this.dir) {
      case 'n':
        if (_dir != 's') { valid = true; }
        break;
      case 'e':
        if (_dir != 'w') { valid = true; }
        break;
      case 's':
        if (_dir != 'n') { valid = true; }
        break;
      case 'w':
        if (_dir != 'e') { valid = true; }
        break;
    }
    if (valid) { this.dir = _dir; }
    // Execute Move
    this.move();
  }
  
  void move() {
    // Track Move
    this.track(this.head);
    
    // Update Snakes position
    switch(this.dir) {
      case 'n':
        this.head.y -= (this.speed * this.scale);
        break;
      case 'e':
        this.head.x += (this.speed * this.scale);
        break;
      case 's':
        this.head.y += (this.speed * this.scale);
        break;
      case 'w':
        this.head.x -= (this.speed * this.scale);
        break;
    }
    
    int _x = this.constrain(this.head.x, 0, width - this.scale);
    int _y = this.constrain(this.head.y, 0, height - this.scale);
    this.head.x = _x;
    this.head.y = _y;
  }
  
  void show() {
    //println("Displaying " + (this.count + 1) + " segments.");
    fill(this.c);
    rectMode(CENTER);
    PVector v;
    int sentinal = 0;
    for (int i = this.path.size() - 1; i >= 0; i--) {
      if (sentinal > this.count){ break; }        // Only display limited number of segments
      v = this.path.get(i);
      rect(v.x, v.y, this.scale, this.scale);
      sentinal += 1;
    }
  }
  
  void track(PVector v) {
    this.path.add(new PVector(v.x, v.y));
    while (this.path.size() > this.max) {
      this.path.remove(0);
    }
  }
  
  void update() {
    this.move();
    this.show();
  }
}
