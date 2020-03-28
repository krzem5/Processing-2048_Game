class Tile {
  PVector pos;
  int value;
  color[] colors={color(#eee4da), color(#ede0c8), color(#f2b179), color(#f59563), color(#f67c5f), color(#f65e3b), color(#edcf72), color(#edcc61), color(#edc850), color(#edc53f), color(#edc22e)};
  Tile(PVector pos) {
    this.pos=pos;
    this.value=0;
  }
  void setValue(int v) {
    this.value=v;
  }
  void draw() {
    if (this.value>0) {
      noStroke();
      if (log2(this.value)-1>10) {
        fill(#3c3a32);
      } else {
        fill(this.colors[int(log2(this.value)-1)]);
      }
      rect(this.pos.x*115+15, this.pos.y*115+15, 100, 100, 3);
      textSize(30);
      textAlign(CENTER, CENTER);
      if (this.value<8) {
        fill(#776e65);
      } else {
        fill(#f9f6f2);
      }
      text(this.value, this.pos.x*115+65, this.pos.y*115+65);
    }
    //font color(2,4)-#776e65
    //font color(8+)-#f9f6f2
  }
}
float log2(float n) {
  return (log(n)/log(2));
}
