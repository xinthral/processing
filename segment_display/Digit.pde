class Digit {
  PVector position;
  float scale, h, w, offColor;
  int value;
  int[] pattern = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B, 0x77, 0x1F, 0x4E, 0x3D, 0x4F, 0x47, 0xD, 0x5F, 0x17, 0x10, 0x30, 0x76, 0x15, 0x1D, 0x67, 0x73, 0x5, 0x5B, 0xF, 0x3E, 0x1C, 0x3B, 0x6D};
  char[] letters = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'b', 'C', 'd', 'E', 'F', 'c', 'G', 'h', 'i', 'l', 'N', 'n', 'o', 'P', 'q', 'r', 'S', 't', 'U', 'u', 'Y', 'Z'};
  
  Digit(float _x, float _y, float _scale) {
    this.position = new PVector(_x, _y);
    this.scale = _scale;
    this.value = 0;
    this.offColor = 255;
    this.h = 10;
    this.w = 5;
  }
  
  color getColor(int _value, int shift) {
    int r = 255;
    int g = 150;
    int b = 0;
    int a = 255 * ((_value >> shift) & 1);
    return color(r, g, b, a);
  }
  
  int getIndex(int letter) {
    int response = 0;
    for (int i = 0; i < letters.length; i++) {
      //char tmp = (char) letter;
      if (letter == letters[i]) {
        response = i;
      }
    }
    return response;
  }
  
  void reShow(){
    this.show(this.value);
  }
  
  void show(int _value) {
    this.value = _value;
    rectMode(CENTER);
    noFill();
    
    // A
    //if (((_value >> 6) & 1) != 0) { fill(0); } else { fill(this.offColor); }
    fill(getColor(_value, 6));
    rect(this.position.x, (this.position.y - ((this.h * this.scale) + (this.h + this.w))), (this.h * this.scale), (1 * this.scale));
    
    // B
    //if (((_value >> 5) & 1) != 0) { fill(0); } else { fill(this.offColor); }
    fill(getColor(_value, 5));
    rect((this.position.x + (this.w * this.scale)), (this.position.y - (this.w * this.scale) - (this.scale)), (1 * this.scale), (this.h * this.scale));
    
    // C
    //if (((_value >> 4) & 1) != 0) { fill(0); } else { fill(this.offColor); }
    fill(getColor(_value, 4));
    rect((this.position.x + (this.w * this.scale)), (this.position.y + (this.w * this.scale) + (this.scale)), (1 * this.scale), (this.h * this.scale));
    
    // D
    //if (((_value >> 3) & 0xFF) != 0) { fill(0); } else { fill(this.offColor); }
    fill(getColor(_value, 3));
    rect(this.position.x, (this.position.y + ((this.h * this.scale) + (this.h + this.w))), (this.h * this.scale), (1 * this.scale));

    // E
    //if (((_value >> 3) & 0xFF) != 0) { fill(0); } else { fill(this.offColor); }
    fill(getColor(_value, 2));
    rect((this.position.x - (this.w * this.scale)), (this.position.y + (this.w * this.scale) + (this.scale)), (1 * this.scale), (this.h * this.scale));
    
    // F
    //if (((_value >> 3) & 0xFF) != 0) { fill(0); } else { fill(this.offColor); }
    fill(getColor(_value, 1));
    rect((this.position.x - (this.w * this.scale)), (this.position.y - (this.w * this.scale) - (this.scale)), (1 * this.scale), (this.h * this.scale));
    
    // G
    //if (((_value >> 6) & 1) != 0) { fill(0); } else { fill(this.offColor); }
    fill(getColor(_value, 0));
    rect(this.position.x, this.position.y, (this.h * this.scale), (1 * this.scale));
  }
  
  void update(int _value) {
    this.show(this.pattern[_value]);
  }
  
  void update() {
    this.reShow();
  }
}
