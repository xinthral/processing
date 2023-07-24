class Food {
  String name;
  String[] nameChoices = {"Apple", "Carrot", "Sucker", "Watermelon"};
  PVector pos;
  int scale = 10;
  color c = color(255, 0, 0);
  
  Food() {
    this.name = nameChoices[floor(random(0, nameChoices.length))];
    this.shuffle();
  }
  
  void shuffle() {
    float _x = floor(random(0, width/this.scale)) * this.scale;
    float _y = floor(random(0, height/this.scale)) * this.scale;
    pos = new PVector(_x, _y);
  }
  
  void show() {
    fill(this.c);
    rectMode(CENTER);
    rect(this.pos.x, this.pos.y, this.scale, this.scale);
  }
  
  void update(Snake snake) {
    if (dist(this.pos.x, this.pos.y, snake.head.x, snake.head.y) < 2) {
      int r = floor(random(0, 255));
      int g = floor(random(0, 255));
      int b = floor(random(0, 255));
      this.c = color(r, g, b);
      this.shuffle();
      snake.grow();
    }
    this.show();
  }
}
