Puck puck;
Paddle left;
Paddle right;
Boolean pause;

void settings() {
  size(600, 600);
  fullScreen(P2D);
}

void setup() {
  //background(0);
  puck = new Puck();
  right = new Paddle(1);
  left = new Paddle(0);
  pause = false;
}

void draw() {
  background(0);
  
  // Phase1: Check Collision 
  puck.checkCollision(left);
  puck.checkCollision(right);
  
  // Phase2: Move Objects
  puck.update();
  left.update();
  right.update();
  
  // Phase3: Redraw Objects
  puck.show();
  left.show();
  right.show();
  
  // Phase4: Loop maintenance
  if (puck.reset) {
    left.y = height / 2;
    right.y = height / 2;
    puck.reset = false;
  }
  
  // Phase5: System Override
  if (pause) {
    delay(5000);
    pause = false;
  }
}

void pause() {
  fill(0, 408, 612, 204);
  textSize(50);
  text("PAUSED", 10, height - 30);
  text("PAUSED", 10, height - 50, -120);
  pause = true;
}

void keyPressed() {
  switch(key) {
    case 'q':
      println("Quitting...");
      noLoop();
      exit();
      break;
    case 'p':
      println("Temporarily Paused...");
      pause();
      break;
    case 'w':
      left.move('u');
      break;
    case 's':
      left.move('d');
      break;
    case 'd':
      left.fire();
      break;
    case 'i':
      right.move('u');
      break;
    case 'k':
      right.move('d');
      break;   
    case 'j':
      right.fire();
      break;
    case 'f':
      puck.speedUp(2);
  }
}

void keyReleased() {
  switch(key) {
    case 'w':
    case 's':
      left.halt();
      break;
    case 'i':
    case 'k':
      right.halt();
      break;
  }
}
