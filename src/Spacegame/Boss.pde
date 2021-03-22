class Boss {
  int x, y, speed, r, health;

  Boss(int x, int y) {
    this.x=x;
    this.y=y;
    speed = int (random(2, 3));
    r = 15;
    health=60;
  }

  // Collison of enemyship and gunfire
  boolean gunfirebossIntersection(Gunfire f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r +f.r) {
      return true;
    } else {
      return false;
    }
  }


  boolean reachedL() {    
    if (x<-5) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedR() {
    if (x>width+5) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedU() {
    if (y<-5) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedD() {
    if (y>height+5) {
      return true;
    } else {
      return false;
    }
  }

  void UL() {
    y+=speed;
    x-=speed;
  }
  void RU() {
    x-=speed;
    y-=speed;
  }
  void DR() {
    y-=speed;
    x+=speed;
  }
  void LD() {
    x+=speed;
    y-=speed;
  }


  void display() {
    if (!down) {
      rectMode(CENTER); 
      stroke(120);
      line(x+22.5, y, x+22.5, y+15);
      line(x-22.5, y, x-22.5, y+15);
      fill(255, 100, 0);
      ellipse(x-37.5, y-52.5, 22.5, 22.5);
      ellipse(x+37.5, y-52.5, 22.5, 22.5);
      fill(75);
      stroke(75);
      rect(x-37.5, y-37.5, 22.5, 45, 12);
      rect(x+37.5, y-37.5, 22.5, 45, 12);
      fill(#8B8585);
      stroke(#8B8585);
      triangle(x, y+30, x+30, y-12, x-30, y-12);
      ellipse(x, y-7.5, 30, 120);
      rect(x, y-27, 60, 30);
      quad(x-30, y-42, x+30, y-42, x+15, y-67.5, x-15, y-67.5);
    } else {
      rectMode(CENTER); 
      stroke(120);
      line(x+22.5, y, x+22.5, y-15);
      line(x-22.5, y, x-22.5, y-15);
      fill(255, 100, 0);
      ellipse(x-37.5, y+52.5, 22.5, 22.5);
      ellipse(x+37.5, y+52.5, 22.5, 22.5);
      fill(75);
      stroke(75);
      rect(x-37.5, y+37.5, 22.5, 45, 12);
      rect(x+37.5, y+37.5, 22.5, 45, 12);
      fill(#8B8585);
      stroke(#8B8585);
      triangle(x, y-30, x+30, y+12, x-30, y+12);
      ellipse(x, y+7.5, 30, 120);
      rect(x, y+27, 60, 30);
      quad(x-30, y+42, x+30, y+42, x+15, y+67.5, x-15, y+67.5);
    }
  }
}
