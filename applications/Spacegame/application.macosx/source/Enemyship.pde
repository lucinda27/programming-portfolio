class Enemyship {
  int x, y, speed, r, health;

  Enemyship(int x, int y) {
    this.x=x;
    this.y=y;
    speed = int (random(2, 3));
    r = 15;
    health=60;
  }

  // Collison of enemyship and gunfire
  boolean gunfireenemyIntersection(Gunfire f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r +f.r) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedSide() {
    if (left) {
      if (x>width-5) {
        return true;
      } else {
        return false;
      }
    } else {
      if (x<5) {
        return true;
      } else {
        return false;
      }
    }
  }

  void move() {
    if (left) {
      x+=speed;
    } else {
      x-=speed;
    }
  }


  void display() {
    rectMode(CENTER); 
    stroke(120);
    line(x+13.5, y, x+13.5, y+9);
    line(x-13.5, y, x-13.5, y+9);
    fill(255, 100, 0);
    ellipse(x-22.5, y-31.5, 13.5, 13.5);
    ellipse(x+22.5, y-31.5, 13.5, 13.5);
    fill(75);
    stroke(75);
    rect(x-22.5, y-22.5, 13.5, 27, 7.2);
    rect(x+22.5, y-22.5, 13.5, 27, 7.2);
    fill(#8B8585);
    stroke(#8B8585);
    triangle(x, y+18, x+18, y-7.2, x-18, y-7.2);
    ellipse(x, y-4.5, 18, 72);
    rect(x, y-16.2, 36, 18);
    quad(x-18, y-25.2, x+18, y-25.2, x+9, y-40.5, x-9, y-40.5);
  }
}
