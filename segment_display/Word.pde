class Word {
  ArrayList<Digit> letters = new ArrayList<Digit>();
  String word;
  int len, start, distance, scale;
  Word(String input, int _start, int _distance, int _scale) {
    this.word = input;
    this.len = input.length();
    this.start = _start;
    this.distance = _distance;
    this.scale = _scale;
  }
  
  void build() {
    createDigits();
  }
  
  void createDigits() {
    Digit d = new Digit(this.start + this.distance * 1, height/2, this.scale);
    d.update(0);
    letters.add(d);
    for (int i = 1; i < this.len; i++) {
      letters.add(new Digit(this.start + this.distance * i, height/2, this.scale));
      
    }
  }
  
  void update() {
    for (Digit l : letters) {
      l.update();
    }
  }
}
