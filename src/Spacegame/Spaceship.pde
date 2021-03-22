class Spaceship {
  // member variables
  int x, y, health, r;
  //color c;
  float easing; //how ship would handle movement l to r
  
  // constructer
  Spaceship() {
    x=0;
    y=0;
    health=100;
    //color =
    easing=0.05;
    r=25;
  }
  // Collison of asteroid and ship
  boolean asteroidIntersection(Asteroid asteroid) {
    float distance = dist(x,y, asteroid.x, asteroid.y);
    if (distance < r+asteroid.r) {
      return true;
    } else {
      return false;
    }
  }
  
  // Collision of enemyfire and ship
  boolean enemyfireIntersection(Enemyfire f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r +f.r) {
      return true;
    } else {
      return false;
    }
  }
  
  // member methods (ex: display)
  void display(int x, int y) {
    this.x=x;
    this.y=y;
    rectMode(CENTER); 
    stroke(120);
    line(x+15, y, x+15, y-10);
    line(x-15, y, x-15, y-10);
    fill(255, 100, 0);
    ellipse(x-25, y+35, 15, 15);
    ellipse(x+25, y+35, 15, 15);
    fill(75);
    stroke(75);
    rect(x-25, y+25, 15, 30, 8);
    rect(x+25, y+25, 15, 30, 8);
    fill(200);
    stroke(200);
    triangle(x, y-20, x+20, y+8, x-20, y+8);
    ellipse(x, y+5, 20, 80);
    rect(x, y+18, 40, 20);
    quad(x-20, y+28, x+20, y+28, x+10, y+45, x-10, y+45);
  }
}
