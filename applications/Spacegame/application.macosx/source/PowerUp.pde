class Powerup {
  int x, y, speed, r, type;
  String[] typeInfo = {"Ammo", "Health", "Gunfire", "Super"};
  // ideas: shield, health, some kind of weapon?

  Powerup(int x, int y) {
    this.x=x;
    this.y=y;
    speed = int (random(2, 5));
    r= 10;
    type = int(random(4));
  }
  
  
  boolean reachedBottom() {
    if (y>height+r) {
      return true;
    } else {
      return false;
    }
  }
  
  void move() {
    y+=speed;
  }
  void display() {
    noStroke();
    switch(type) {
    case 0: //Ammo
    case 1:
    case 2:
    case 3:
    }
    fill(#795242);
    ellipse(x, y, r, r);
  }
}
