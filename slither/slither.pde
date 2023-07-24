Snake p1 = new Snake(); 
Food f1 = new Food();

void setup() {
  size(600, 600);
  frameRate(10);
}

void draw() {
  background(132);
  p1.update();
  f1.update(p1);
}

void keyPressed() {
  switch(key) {
    case 'q':
      noLoop();
      exit();
      break;
    case 'p':
      delay(5000);
      break;     
    case 'w':
      p1.move('n');
      break;
    case 'd':
      p1.move('e');
      break;
    case 's':
      p1.move('s');
      break;
    case 'a':
      p1.move('w');
      break;
    case 'f':
      p1.grow();
      break;
  }
}
