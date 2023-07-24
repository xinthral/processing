Digit ttds;
Digit thds;
Digit huns;
Digit tens;
Digit ones;
Word word;

int count, cycle;

void setup() {
  size(1000, 800);
  int scale = 4;
  int start = 100 * scale / 10;
  int distance = 140 * scale / 10;
  
  word = new Word("CorEY", start, distance, scale);
  
  ttds = new Digit(start, height/2, scale);
  thds = new Digit(start + distance * 1, height/2, scale);
  huns = new Digit(start + distance * 2, height/2, scale);
  tens = new Digit(start + distance * 3, height/2, scale);
  ones = new Digit(start + distance * 4, height/2, scale);
  
  count = 0;
  frameRate(2);
}

void draw() {  
  background(0);
  int time = 20;
  word.update();
  
  if (count < time) {
    tens.update(round(count / 10));    
    ones.update((count % 10));
  } else if (count < (time * 2)) {
    ttds.update((count % 10));
    thds.update(thds.getIndex('S'));
    huns.update(huns.getIndex('h'));
    tens.update(tens.getIndex('i'));
    ones.update(ones.getIndex('t'));
  } else {
    ttds.update(ttds.getIndex('C'));
    thds.update(thds.getIndex('o'));
    huns.update(huns.getIndex('r'));
    tens.update(tens.getIndex('E'));
    ones.update(ones.getIndex('Y'));
  }
  count++;
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
  }
}
