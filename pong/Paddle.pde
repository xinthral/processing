class Paddle {
  float x;
  float y;
  int h = 100;
  int w = 10;
  int speed = 10;
  int locomotion = 0;
  boolean r = false;
  boolean l = false;
  
  Paddle(int side) {
    y = height * 0.5 - this.h * 0.5;
    if(side > 0) {
      this.x = width - (this.w);
      this.r = true;
      println("Right Created");
    } else {
      this.x = this.w;
      this.l = true;
      println("Left Created");
    }
  }
  
  void fire() {
    this.h += 10;
  }
  
  void move(char dir) {
    if (dir == 'u') {
      this.locomotion = this.speed * -1;
    }
    if (dir == 'd') {
      this.locomotion = this.speed;
    }
  }
  
  void show() {
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h);
  }
  
  void halt() {
    this.locomotion = 0;
  }
  
  void update() {
    this.y = this.y + this.locomotion;
    this.y = constrain(this.y, (this.h / 2), (height - this.h / 2)); 
  }
}
