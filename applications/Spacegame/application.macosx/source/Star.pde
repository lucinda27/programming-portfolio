class Starfield {
  int x, y, w;
  color c;

  Starfield(int x, int y, color c) {
    this.x=x;
    this.y=y;
    this.c=c;
    w=int(random(1, 4));
  }
  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  void move() {
    y+=random(2, 4);
  }
  void display() {
    noStroke();
    fill(c);
    if (play) {
      ellipse(x, y-100, w, w);
    } else {
      ellipse(x, y, w, w);
    }
  }
}
