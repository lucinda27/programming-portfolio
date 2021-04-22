class Gunfire {
  int x, y, speed, r;
  color c;

  Gunfire(color c, int x, int y, int speed) {
    this.c=c;
    this.x=x;
    this.y=y;
    this.speed=speed;
    r=4;
  }

  void shoot() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y<0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(x, y, r, r);
    //stroke(c);
    //line(x, y-5, x, y+80);
  }
}
