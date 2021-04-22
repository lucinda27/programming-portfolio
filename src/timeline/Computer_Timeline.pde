// Lucy Madsen Computer Timeline
// September 2020
boolean hover = false;


void setup() {
  size(900, 400);
}

void draw() {
  background(0, 150, 200);
  drawRef();
  histEvent(80, 155, 150, 25, "Boolean algebra-1854", "                                                                                                                                                                                                           Created by George Boole, an English mathematician. It uses two values, true and false (1 and 0), and is the basis for digital computation.", true);
  histEvent(120, 220, 200, 25, "Atanasoff-Berry computer-1942", "Created by John Vincent Atanasoff and Clifford E. Berry, this was the first electronic digital computer. It used vacuum tubes.", false);
  histEvent(270, 155, 100, 25, "ENIAC-1945", "The first electronic programmable computer in the US. It was Turing complete and its programmers were women!", true);
  histEvent(340, 220, 130, 25, "Harwell CADET-1955", "A second generation computer (fully transistorised), created by the electronic division of Harwell.", false);
  histEvent(430, 155, 150, 25, "Integrated Circuit-1958", "Created by Jack Kilby, US, these would be used in third-generation computers.", true);
  histEvent(500, 220, 135, 25, "Atlas computer-1962", "A supercomputer created in the UK by the University of Manchester, Ferranti, and Plessey, and the most powerful computer in the world at the time.", false);
  histEvent(620, 155, 125, 25, "Intel 4004-1971", "Fourth-generation, this was the first single-chip microprocessor. Created by a team at Intel in the US.", true);
  histEvent(700, 220, 125, 25, "Altair 8800-1974", "A commercial microcomputer designed by MITS that was very popular.", false);
}

void drawRef() {

  // Draws the timeline
  strokeWeight(5);
  stroke(50);
  line(100, 200, 800, 200);

  // Draws the title information
  textAlign(CENTER);
  textSize(40);
  fill(255);
  text("Computing Hardware Timeline", width/2, 65);

  // Descriptive title text
  textSize(12);
  fill(255);
  text("Lucy Madsen 2020", width/2, 85);
}

void histEvent(int x, int y, int w, int h, String title, String description, boolean top) {
  //Detection of the mouseover
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);


  // Draws a rectangle
  strokeWeight(2);
  textSize(12);
  fill(255);
  if (hover == true) {
    text(description, 20, 330);
  } else {
  }

  rect(x, y, w, h, 10);

  //Text overlay
  textAlign(LEFT);
  fill(0);
  text(title, x+5, y+20);

  // Connecting line to the timeline
  if (top == true) {
    line(x+20, y+25, x+35, y+45);
  } else {
    line(x+20, y, x+35, y-20);
  }
}
