int x, y;

void setup() {
  size(400, 400);
  frameRate(10);
  // Set start coordinates
  x = 0;
  y = 0;
}

void draw() {
  fill(0);
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      moveRight(5);
    } else if (key == 'a' || key == 'A') {
      moveLeft(5);
    } else if (key == 'w' || key == 'W') {
      moveUp(5);
    } else if (key == 's' || key == 'S') {
      moveDown(5);
    }
  }
  //drawName();
  //noLoop();
}

void mouseClicked() {
  saveFrame("image-######.png");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      moveRight(5);
    } else if (keyCode == LEFT) {
      moveLeft(5);
    } else if (keyCode == UP) {
      moveUp(5);
    } else if (keyCode == DOWN) {
      moveDown(5);
    }
  }
}

// Algorithm for your first name
void drawName() {
  moveRight(25);
  moveDown(100);
  moveRight(50);
  movePPdiagonal(30);
  moveDown(30); 
  moveRight(30);
  moveUp(30);
  moveDown(30);
  movePPdiagonal (30); 
  moveRight(30);
  moveLeft(30);
  moveDown(30);
  moveRight(30);
  movePPdiagonal(30);
  moveDown(30);
  moveRight(30);
  moveUp(30);
  moveDown(30);
  moveNNdiagonal(60);
}


// Method to draw right lines
void moveRight(int rep) {
  for (int i = 0; i<rep; i = i + 1) {
    point(x+i, y);
  }
  x=x+rep;
}

// Method to draw left lines
void moveLeft(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

// Method to draw up lines
void moveUp(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

// Method to draw down lines
void moveDown(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

// Method to draw positive-positive diagonal lines
void movePPdiagonal(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x+i, y-i);
  }
  x=x+rep;
  y=y-rep;
}

// Method to draw negative-negative diagonal lines
void moveNNdiagonal(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x-i, y+i);
  }
  x=x-rep; 
  y=y+rep;
}

// Method to draw positive-negative diagonal lines
void movePNdiagonal(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x+i, y+i);
  }
  x=x+rep;
  y=y+rep;
}

// Method to draw negative-positive diagonal lines
void moveNPdiagonal(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x-i, y-i);
  }
  x=x-rep;
  y=y-rep;
}
