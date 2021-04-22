class Enemyfire {
  int x, y, speed, r;
  color c;

  Enemyfire(color c, int x, int y, int speed) {
    this.c=c;
    this.x=x;
    this.y=y;
    this.speed=speed;
    r=4;
  }
  
  void shoot() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height) {
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
