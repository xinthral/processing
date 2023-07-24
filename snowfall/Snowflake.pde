class Snowflake {
  PVector position, velocity, acceleration;
  float area, mass;
  boolean floater = false;
  
  Snowflake() {
    float _x = random(width);
    float _y = random(height);
    this.position = new PVector(_x, _y);  
    this.mass = 0.1;
    if (random(1) <= 0.05) {
      this.floater = true;
    }
    reset();
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.mult(this.mass);
    this.acceleration.add(f);
  }
  
  void cycle() {
    if (this.position.y > height) {
     this.position.y = random(10) - 5;
     this.position.x = random(width);
     reset(); 
    }
  }
  
  void reset() {
    this.velocity = new PVector(0, 1);
    this.acceleration = new PVector(0, 0);
    this.area = random(10);
  }
  
  void show() {
    ellipseMode(CENTER);
    strokeWeight(this.area);
    circle(this.position.x, this.position.y, 5);
  }
  
  void update(float gravity) {
    if (!this.floater) {
      applyForce(new PVector(0, gravity));
    }
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
    cycle();
    show();
  }
  
}
