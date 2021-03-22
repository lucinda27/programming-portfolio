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
import processing.sound.*;
SoundFile ding;
SoundFile pew;
SoundFile impact;
SoundFile en;
SoundFile en2;
PImage smallest;
PImage small;
PImage big;

void setup() {
  size(500, 500);
  ship=new Spaceship();
  bosses=new ArrayList();
  enemies=new ArrayList();
  asteroids=new ArrayList();
  stars=new ArrayList();
  fires=new ArrayList();
  efires=new ArrayList();
  itimer=new Timer(int(random(1000, 3000)));
  iitimer=new Timer(int(random(1000, 2000)));
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

void draw() {
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
    stars.add(new Starfield(int(random(width)), int(random(height)), color(random(234, 245), random(226, 231), random (153, 178))));
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
        asteroids.add(new Asteroid(int(random(width)), -50, int(random(2))));
        itimer.start();
      }
    }

    if (iitimer.isFinished()) {
      if (level>1) {
        asteroids.add(new Asteroid(int(random(width)), -50, int(random(3))));
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
        impact.amp(0.4);
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
          efires.add(new Enemyfire(color(#2660ED), boss.x+45/2, boss.y, 3));
          efires.add(new Enemyfire(color(#2660ED), boss.x-45/2, boss.y, 3));
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
        efires.add(new Enemyfire(color(#2660ED), enemy.x+27/2, enemy.y, 3));
        efires.add(new Enemyfire(color(#2660ED), enemy.x-27/2, enemy.y, 3));
        eftimer.start();
      }
    }

    //enemy fire information
    for (int i=0; i < efires.size(); i++) {
      Enemyfire efire = efires.get(i);
      efire.display();
      efire.shoot();
      if (ship.enemyfireIntersection(efire)) {
        en2.amp(0.3);
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
          en.amp(0.1);
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
          en.amp(0.1);
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
          impact.amp(0.4);
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

void startScreen() {
  background(0);
  stars.add(new Starfield(int(random(width)), int(random(height-50)), color(random(234, 245), random(226, 231), random (153, 178))));
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

void gameOver() {
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

void gameWon() {
  background(0);
  cursor();
  textSize(20);
  text("Won!", width/2-30, height/2-30);
  textSize(12);
  text("Score:" + score, width/2, height/2+50);
  text("Level reached:" + level, width/2, height/2+100);
  noLoop();
}

void mousePressed() {
  fires.add(new Gunfire(color(#ED2424), ship.x+15, ship.y, 3));
  fires.add(new Gunfire(color(#ED2424), ship.x-15, ship.y, 3));
  if (play) {
    pew.amp(0.3);
    pew.play();
  }
}

void infoPanel() {
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
