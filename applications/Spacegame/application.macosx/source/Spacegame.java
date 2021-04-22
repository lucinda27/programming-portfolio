import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Spacegame extends PApplet {

//2020 Space game
//Lucy Madsen | December 2020
//Programming I

//sounds: findsounds.com (use the .wav sounds)

Spaceship ship;
ArrayList<Enemyship> enemies;
ArrayList<Asteroid> asteroids;
ArrayList<Starfield> stars;
ArrayList<Boss> bosses;
Timer itimer, iitimer, etimer, eftimer, btimer; //add separate timers
ArrayList<Gunfire> fires;
ArrayList<Enemyfire> efires;
ArrayList<Powerup> types;
int score, pass, hit, level, bhealth; //pass is number of objects that don't get taken out
boolean play, left, up, down, right, l;

SoundFile ding;
SoundFile pew;
SoundFile impact;
SoundFile en;
SoundFile en2;
PImage smallest;
PImage small;
PImage big;

public void setup() {
  
  ship=new Spaceship();
  bosses=new ArrayList();
  enemies=new ArrayList();
  asteroids=new ArrayList();
  stars=new ArrayList();
  fires=new ArrayList();
  efires=new ArrayList();
  itimer=new Timer(PApplet.parseInt(random(1000, 3000)));
  iitimer=new Timer(PApplet.parseInt(random(1000, 2000)));
  etimer=new Timer(10000);
  eftimer=new Timer(1000);
  btimer=new Timer(10000);
  itimer.start();
  if (level>1) {
    iitimer.start();
  }
  if (level>2 && level<5) {
    etimer.start();
  }
  if (level>2) {
    eftimer.start();
  }
  score=0;
  pass=0;
  hit=0;
  level=1;
  play=false;
  bhealth=200;
  if (random(10)>5) {
    left=true;
  } else {
    left=false;
  }
  up=true;
  smallest = loadImage("smallestasteroid.png");
  small = loadImage("smallasteroid.png");
  big = loadImage("bigasteroid.png");
  ding = new SoundFile(this, "Ding.wav");
  pew = new SoundFile(this, "pew.wav");
  impact = new SoundFile(this, "impact.wav");
  en = new SoundFile(this, "en.wav");
  en2 = new SoundFile(this, "en2.wav");
}

public void draw() {
  noCursor(); 

  //start screen
  if (!play) {
    startScreen();
    cursor();
  } else {
    background(0);

    //level text
    if (hit>20) {
      textSize(20);
      text("Level: " + level, 200, 50);
    }

    // boss text
    if (level>4) {
      if (hit>25) {
        textSize(12);
        text("Health: " + bhealth, 100, 50);
      }
    }

    //stars
    stars.add(new Starfield(PApplet.parseInt(random(width)), PApplet.parseInt(random(height)), color(random(234, 245), random(226, 231), random (153, 178))));
    for (int i=0; i < stars.size(); i++) {
      Starfield star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    //timers
    if (itimer.isFinished()) {
      if (level<2) {
        asteroids.add(new Asteroid(PApplet.parseInt(random(width)), -50, PApplet.parseInt(random(2))));
        itimer.start();
      }
    }

    if (iitimer.isFinished()) {
      if (level>1) {
        asteroids.add(new Asteroid(PApplet.parseInt(random(width)), -50, PApplet.parseInt(random(3))));
        iitimer.start();
      }
    }

    if (etimer.isFinished()) {
      if (level>2 && level<5) {
        if (left) {
          enemies.add(new Enemyship(0, 100));
        } else {
          enemies.add(new Enemyship(width, 100));
        }
        etimer.start();
      }
    }

    if (btimer.isFinished()) {
      if (level>4) {
        println("up: " + up);
        println("down: " + down);
        println("right: " + right);
        if (up) {
          bosses.add(new Boss(350, -50));
          btimer.start();
        }
        if (right) {
          bosses.add(new Boss(550, 300));
          btimer.start();
        }
        if (down) {
          bosses.add(new Boss(150, 550));
          btimer.start();
        }
        if (l) {
          bosses.add(new Boss(-50, 300));
          btimer.start();
        }
      }
    }


    //asteroid information
    for (int i=0; i < asteroids.size(); i++) {
      Asteroid asteroid = asteroids.get(i);
      asteroid.display();
      asteroid.move();

      // ship asteroid collision
      if (ship.asteroidIntersection(asteroid)) {
        impact.amp(0.4f);
        impact.play();
        ship.health-=10;
        asteroids.remove(asteroid);
      }
      if (asteroid.reachedBottom()) {
        pass++;
        asteroids.remove(asteroid);
      }
    }

    //ship information
    ship.display(mouseX, mouseY);

    //boss
    if (level>4) {
      for (int i=0; i < bosses.size(); i++) {
        Boss boss = bosses.get(i);
        boss.display();
        if (up) {
          boss.UL();
          if (boss.reachedL()) {
            bosses.remove(boss);
            up=false;
            right=true;
          }
        }
        if (right) {
          boss.RU();
          if (boss.reachedU()) {
            bosses.remove(boss);
            right=false;
            down=true;
          }
        }
        if (down) {
          boss.DR();
          if (boss.reachedR()) {
            bosses.remove(boss);
            down=false;
            l=true;
          }
        }
        if (l) {
          boss.LD();
          if (boss.reachedU()) {
            bosses.remove(boss);
            l=false;
            up=true;
          }
        }
        if (eftimer.isFinished()) {
          efires.add(new Enemyfire(color(0xff2660ED), boss.x+45/2, boss.y, 3));
          efires.add(new Enemyfire(color(0xff2660ED), boss.x-45/2, boss.y, 3));
          eftimer.start();
        }
      }
    }

    //enemy information
    for (int i=0; i<enemies.size(); i++) {
      Enemyship enemy = enemies.get(i);
      enemy.display();
      enemy.move();
      if (enemy.reachedSide()) {
        pass++;
        enemies.remove(enemy);
      }

      if (eftimer.isFinished()) {
        efires.add(new Enemyfire(color(0xff2660ED), enemy.x+27/2, enemy.y, 3));
        efires.add(new Enemyfire(color(0xff2660ED), enemy.x-27/2, enemy.y, 3));
        eftimer.start();
      }
    }

    //enemy fire information
    for (int i=0; i < efires.size(); i++) {
      Enemyfire efire = efires.get(i);
      efire.display();
      efire.shoot();
      if (ship.enemyfireIntersection(efire)) {
        en2.amp(0.3f);
        en2.play();
        efires.remove(efire);
        ship.health-=10;
      }
      if (efire.reachedBottom()) {
        efires.remove(efire);
      }
    }

    //gunfire information
    for (int i=0; i < fires.size(); i++) {
      Gunfire fire = fires.get(i);
      fire.display();
      fire.shoot();

      // gunfire boss collision
      for (int j=0; j < bosses.size(); j++) {
        Boss boss = bosses.get(j);
        if (boss.gunfirebossIntersection(fire)) {
          en.amp(0.1f);
          en.play();
          fires.remove(fire);
          score+=10;
          bhealth-=10;
        }
      }

      // gunfire enemyship collision
      for (int j=0; j < enemies.size(); j++) {
        Enemyship enemy = enemies.get(j);
        if (enemy.gunfireenemyIntersection(fire)) {
          en.amp(0.1f);
          en.play();
          fires.remove(fire);
          score+=10;
          enemy.health-=10;
          if (enemy.health<30) {
            enemies.remove(enemy);
            if (left) {
              left=false;
            } else {
              left=true;
            }
          }
        }
      }
      // gunfire asteroid collision
      for (int j=0; j < asteroids.size(); j++) {
        Asteroid asteroid = asteroids.get(j);
        if (asteroid.gunfireIntersection(fire)) {
          impact.amp(0.4f);
          impact.play();
          fires.remove(fire);
          asteroid.health-=10;
          score+=10;
          hit ++;
          println("hit: " + hit);
          if (level<5) {
            if (hit>20 && hit<22) {
              level ++;
              ding.play();
            }
            if (hit>25) {
              if (level>1) {
                hit = -20;
              } else {
                hit = 0;
              }
            }
          }
          if (asteroid.health>49) {
            asteroids.remove(asteroid);
            asteroids.add(new Asteroid(asteroid.x, asteroid.y, 1));
          }
          if (asteroid.health>39) {
            asteroids.remove(asteroid);
            asteroids.add(new Asteroid(asteroid.x, asteroid.y, 0));
          }
          if (asteroid.health>29) {
            asteroids.remove(asteroid);
          }
        }
      }
      if (fire.reachedTop()) {
        fires.remove(fire);
      }
    }

    infoPanel();

    // Game over logic
    if (ship.health<1 || pass>9) {
      play=false;
      gameOver();
    }
    if (bhealth<1) {
      play=false;
      ding.play();
      gameWon();
    }
  }
}

public void startScreen() {
  background(0);
  stars.add(new Starfield(PApplet.parseInt(random(width)), PApplet.parseInt(random(height-50)), color(random(234, 245), random(226, 231), random (153, 178))));
  for (int i=0; i < stars.size(); i++) {
    Starfield star = stars.get(i);
    star.display();
  }
  textSize(16);
  text("Click to start", width/2-50, height/2);
  textSize(12);
  text("Survive five levels of asteroids and enemy ships to defeat the flagship!", width/2-200, height-25);

  if (mousePressed) {
    play = true;
    for (int i=0; i < stars.size(); i++) {
      Starfield star = stars.get(i);
      stars.remove(star);
    }
  }
}

public void gameOver() {
  background(0);
  cursor();
  textSize(20);
  text("Lost", width/2-30, height/2-30);
  textSize(12);
  text("Score:" + score, width/2, height/2+50);
  text("Level reached:" + level, width/2, height/2+100);
  noLoop();
  // how to restart game afterwards?
}

public void gameWon() {
  background(0);
  cursor();
  textSize(20);
  text("Won!", width/2-30, height/2-30);
  textSize(12);
  text("Score:" + score, width/2, height/2+50);
  text("Level reached:" + level, width/2, height/2+100);
  noLoop();
}

public void mousePressed() {
  fires.add(new Gunfire(color(0xffED2424), ship.x+15, ship.y, 3));
  fires.add(new Gunfire(color(0xffED2424), ship.x-15, ship.y, 3));
  if (play) {
    pew.amp(0.3f);
    pew.play();
  }
}

public void infoPanel() {
  noStroke();
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, height-50);
  fill(255, 128);
  textSize(12);
  text("health: " + ship.health, 20, height-25);
  text("pass: " +pass, 120, height-25);
  text("level: " +level, 220, height-25);
  text("score: " + score, 320, height-25);
}
class Asteroid {
  int x, y, speed, r, size, health;
  String[] sizeInfo = {"big", "small", "smallest"};

  Asteroid(int x, int y, int size) {
    this.x=x;
    this.y=y;
    speed = PApplet.parseInt (random(2, 3));
    r = 15;
    this.size=size;
  }

  // Collison of asteroid and gunfire
  public boolean gunfireIntersection(Gunfire f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r +f.r) {
      return true;
    } else {
      return false;
    }
  }

  public boolean reachedBottom() {
    if (y>height+small.width) {
      return true;
    } else {
      return false;
    }
  }

  public void move() {
    y+=speed;
  }

  public void big() {
    switch(size) {
    case 0:
      image(big, x, y);
      break;
    }
  }
  public void small() {
    switch(size) {
    case 1:
      image(small, x, y);
      break;
    }
  }
  public void smallest() {
    switch(size) {
    case 2:
      image(smallest, x, y);
      break;
    }
  }

  public void display() {
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
class Boss {
  int x, y, speed, r, health;

  Boss(int x, int y) {
    this.x=x;
    this.y=y;
    speed = PApplet.parseInt (random(2, 3));
    r = 15;
    health=60;
  }

  // Collison of enemyship and gunfire
  public boolean gunfirebossIntersection(Gunfire f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r +f.r) {
      return true;
    } else {
      return false;
    }
  }


  public boolean reachedL() {    
    if (x<-5) {
      return true;
    } else {
      return false;
    }
  }

  public boolean reachedR() {
    if (x>width+5) {
      return true;
    } else {
      return false;
    }
  }

  public boolean reachedU() {
    if (y<-5) {
      return true;
    } else {
      return false;
    }
  }
  public boolean reachedD() {
    if (y>height+5) {
      return true;
    } else {
      return false;
    }
  }

  public void UL() {
    y+=speed;
    x-=speed;
  }
  public void RU() {
    x-=speed;
    y-=speed;
  }
  public void DR() {
    y-=speed;
    x+=speed;
  }
  public void LD() {
    x+=speed;
    y-=speed;
  }


  public void display() {
    if (!down) {
      rectMode(CENTER); 
      stroke(120);
      line(x+22.5f, y, x+22.5f, y+15);
      line(x-22.5f, y, x-22.5f, y+15);
      fill(255, 100, 0);
      ellipse(x-37.5f, y-52.5f, 22.5f, 22.5f);
      ellipse(x+37.5f, y-52.5f, 22.5f, 22.5f);
      fill(75);
      stroke(75);
      rect(x-37.5f, y-37.5f, 22.5f, 45, 12);
      rect(x+37.5f, y-37.5f, 22.5f, 45, 12);
      fill(0xff8B8585);
      stroke(0xff8B8585);
      triangle(x, y+30, x+30, y-12, x-30, y-12);
      ellipse(x, y-7.5f, 30, 120);
      rect(x, y-27, 60, 30);
      quad(x-30, y-42, x+30, y-42, x+15, y-67.5f, x-15, y-67.5f);
    } else {
      rectMode(CENTER); 
      stroke(120);
      line(x+22.5f, y, x+22.5f, y-15);
      line(x-22.5f, y, x-22.5f, y-15);
      fill(255, 100, 0);
      ellipse(x-37.5f, y+52.5f, 22.5f, 22.5f);
      ellipse(x+37.5f, y+52.5f, 22.5f, 22.5f);
      fill(75);
      stroke(75);
      rect(x-37.5f, y+37.5f, 22.5f, 45, 12);
      rect(x+37.5f, y+37.5f, 22.5f, 45, 12);
      fill(0xff8B8585);
      stroke(0xff8B8585);
      triangle(x, y-30, x+30, y+12, x-30, y+12);
      ellipse(x, y+7.5f, 30, 120);
      rect(x, y+27, 60, 30);
      quad(x-30, y+42, x+30, y+42, x+15, y+67.5f, x-15, y+67.5f);
    }
  }
}
class Enemyfire {
  int x, y, speed, r;
  int c;

  Enemyfire(int c, int x, int y, int speed) {
    this.c=c;
    this.x=x;
    this.y=y;
    this.speed=speed;
    r=4;
  }
  
  public void shoot() {
    y+=speed;
  }

  public boolean reachedBottom() {
    if (y>height) {
      return true;
    } else {
      return false;
    }
  }
  
  public void display() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(x, y, r, r);
    //stroke(c);
    //line(x, y-5, x, y+80);
  }
}
class Enemyship {
  int x, y, speed, r, health;

  Enemyship(int x, int y) {
    this.x=x;
    this.y=y;
    speed = PApplet.parseInt (random(2, 3));
    r = 15;
    health=60;
  }

  // Collison of enemyship and gunfire
  public boolean gunfireenemyIntersection(Gunfire f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r +f.r) {
      return true;
    } else {
      return false;
    }
  }

  public boolean reachedSide() {
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

  public void move() {
    if (left) {
      x+=speed;
    } else {
      x-=speed;
    }
  }


  public void display() {
    rectMode(CENTER); 
    stroke(120);
    line(x+13.5f, y, x+13.5f, y+9);
    line(x-13.5f, y, x-13.5f, y+9);
    fill(255, 100, 0);
    ellipse(x-22.5f, y-31.5f, 13.5f, 13.5f);
    ellipse(x+22.5f, y-31.5f, 13.5f, 13.5f);
    fill(75);
    stroke(75);
    rect(x-22.5f, y-22.5f, 13.5f, 27, 7.2f);
    rect(x+22.5f, y-22.5f, 13.5f, 27, 7.2f);
    fill(0xff8B8585);
    stroke(0xff8B8585);
    triangle(x, y+18, x+18, y-7.2f, x-18, y-7.2f);
    ellipse(x, y-4.5f, 18, 72);
    rect(x, y-16.2f, 36, 18);
    quad(x-18, y-25.2f, x+18, y-25.2f, x+9, y-40.5f, x-9, y-40.5f);
  }
}
class Gunfire {
  int x, y, speed, r;
  int c;

  Gunfire(int c, int x, int y, int speed) {
    this.c=c;
    this.x=x;
    this.y=y;
    this.speed=speed;
    r=4;
  }

  public void shoot() {
    y-=speed;
  }

  public boolean reachedTop() {
    if (y<0) {
      return true;
    } else {
      return false;
    }
  }

  public void display() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(x, y, r, r);
    //stroke(c);
    //line(x, y-5, x, y+80);
  }
}
class Powerup {
  int x, y, speed, r, type;
  String[] typeInfo = {"Ammo", "Health", "Gunfire", "Super"};
  // ideas: shield, health, some kind of weapon?

  Powerup(int x, int y) {
    this.x=x;
    this.y=y;
    speed = PApplet.parseInt (random(2, 5));
    r= 10;
    type = PApplet.parseInt(random(4));
  }
  
  
  public boolean reachedBottom() {
    if (y>height+r) {
      return true;
    } else {
      return false;
    }
  }
  
  public void move() {
    y+=speed;
  }
  public void display() {
    noStroke();
    switch(type) {
    case 0: //Ammo
    case 1:
    case 2:
    case 3:
    }
    fill(0xff795242);
    ellipse(x, y, r, r);
  }
}
class Spaceship {
  // member variables
  int x, y, health, r;
  //color c;
  
  // constructer
  Spaceship() {
    x=0;
    y=0;
    health=100;
    //color =
    r=25;
  }
  // Collison of asteroid and ship
  public boolean asteroidIntersection(Asteroid asteroid) {
    float distance = dist(x,y, asteroid.x, asteroid.y);
    if (distance < r+asteroid.r) {
      return true;
    } else {
      return false;
    }
  }
  
  // Collision of enemyfire and ship
  public boolean enemyfireIntersection(Enemyfire f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r +f.r) {
      return true;
    } else {
      return false;
    }
  }
  
  // member methods (ex: display)
  public void display(int x, int y) {
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
class Starfield {
  int x, y, w;
  int c;

  Starfield(int x, int y, int c) {
    this.x=x;
    this.y=y;
    this.c=c;
    w=PApplet.parseInt(random(1, 4));
  }
  public boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  public void move() {
    y+=random(2, 4);
  }
  public void display() {
    noStroke();
    fill(c);
    if (play) {
      ellipse(x, y-100, w, w);
    } else {
      ellipse(x, y, w, w);
    }
  }
}
// Example 10-5: Object-oriented timer
// by Daniel Shiffman

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  public void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  public boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Spacegame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
