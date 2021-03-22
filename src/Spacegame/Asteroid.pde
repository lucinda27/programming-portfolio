class Asteroid {
  int x, y, speed, r, size, health;
  String[] sizeInfo = {"big", "small", "smallest"};

  Asteroid(int x, int y, int size) {
    this.x=x;
    this.y=y;
    speed = int (random(2, 3));
    r = 15;
    this.size=size;
  }

  // Collison of asteroid and gunfire
  boolean gunfireIntersection(Gunfire f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r +f.r) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y>height+small.width) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=speed;
  }

  void big() {
    switch(size) {
    case 0:
      image(big, x, y);
      break;
    }
  }
  void small() {
    switch(size) {
    case 1:
      image(small, x, y);
      break;
    }
  }
  void smallest() {
    switch(size) {
    case 2:
      image(smallest, x, y);
      break;
    }
  }

  void display() {
    imageMode(CENTER);
    switch(size) {
    case 2:
      image(big, x, y);
      health=60;
      break;
    case 1:
      image(small, x, y);
      health=50;
      break;
    case 0:
      image(smallest, x, y);
      health=40;
      break;
    }
  }
}
