ArrayList<Tile> board=new ArrayList<Tile>(16);
int can_move=0;
void setup() {
  size(515, 515);
  for (int i=0; i<16; i++) {
    board.add(new Tile(_pos(i)));
  }
  IntList r=new IntList(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
  r.shuffle();
  board.get(r.get(0)).setValue(2048);
  board.get(r.get(1)).setValue(2);
}
void draw() {
  try_move();
  background(0);
  translate(20, 20);
  noStroke();
  fill(#bbada0);
  rect(0, 0, 475, 475, 6);
  fill(#cdc1b4);
  for (int i=0; i<16; i++) {
    PVector pos=_pos(i);
    rect(pos.x*115+15, pos.y*115+15, 100, 100, 3);
  }
  for (Tile t : board) {
    t.draw();
  }
}
int _idx(PVector p) {
  return int(p.x)+int(p.y)*4;
}
PVector _pos(int i) {
  return new PVector(i%4, int(i/4.0));
}
void try_move() {
  can_move=max(can_move-1, 0);
  int d=-1;
  if (can_move==0&&mousePressed&&mouseButton==LEFT) {
    PVector m=new PVector(mouseX-pmouseX, mouseY-pmouseY);
    if (m.y<0&&m.y<m.x) {
      d=0;
    } else if (m.x>0&&m.x>m.y) {
      d=1;
    } else if (m.y>0&&m.y>m.x) {
      d=2;
    } else if (m.x<0&&m.x<m.y) {
      d=3;
    }
    can_move=50;
  }
  if (d!=-1) {
    move(d);
  }
}
void move(int d) {
  println(d);
}
