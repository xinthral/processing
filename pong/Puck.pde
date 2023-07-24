class Puck {
  float x;
  float y;
  float acceleration;
  float xspeed;
  float yspeed;
  float diameter = 25;
  float radius;
  float angle;
  boolean reset = false;
  
  Puck() {
    
    reset();
  }
  
  void boundToCanvas() {
    if (this.y - this.radius < 0 || this.y + this.radius > height) {
      reflect('y');
    }
    // Right Paddle Wins
    if (this.x < 0) {
      reset();
    }
    // Left Paddle Wins
    if (this.x > width) {
      reset();
    }
  }
  
  void checkCollision(Paddle p) {
    // Check Vertial Bounds
    if ((this.y + this.radius) > (p.y - p.h) && (this.y - this.radius) < (p.y + p.h)){
      // Check Horizontal Bounds
      if (p.x > (width / 2)) {
        // Right Paddle
        if ((this.x + this.radius) > (p.x - p.w)) {
          reflect('x');
        }
      } else {
        // Left Paddle
        if ((this.x - this.radius) < (p.x + p.w)) {
          reflect('x');
        }
      }
    }
  }
  
  void reflect(char dir) {
    if (dir == 'y') {
      yspeed *= -1;
    }
    if (dir == 'x') {
      xspeed *= -1;
    }
  }
  
  void reset() {
    this.radius = diameter * 0.5;
    this.reset = true;
    this.acceleration = 4;
    this.angle = random(TWO_PI);
    speedUp(this.acceleration);
    this.x = width / 2;
    this.y = height / 2;
  }
  
  void show() {
    fill(255);
    ellipseMode(CENTER);
    circle(x, y, this.diameter);
  }
  
  void speedUp(float multiplier) {
    this.acceleration *= multiplier;
    this.xspeed = this.acceleration * cos(this.angle);
    this.yspeed = (this.acceleration / 4) * sin(this.angle);
  }
  
  void update() {
    boundToCanvas();
    x = x + xspeed;
    y = y + yspeed;
    show();
  }
}
