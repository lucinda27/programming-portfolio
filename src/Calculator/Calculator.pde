//2020 Calculator
//Lucy Madsen | November 2020
//Programming I

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[19];
String displayValue;
String op; //operator to use in calculation
float r; //what is right of operator
float l; //what is left of the operator
float result; //answer
boolean left; 
float deg;


void setup() {
  size(400, 500);
  displayValue = "0";
  op = " ";
  r=0;
  l=0;
  result=0;
  left=true;
  numButtons[0] = new Button(360, 180, 40, 32, #D8E3FF, #D8E3FF, "0");
  numButtons[1] = new Button(360, 212, 40, 32, #D8E3FF, #D8E3FF, "1");
  numButtons[2] = new Button(360, 244, 40, 32, #D8E3FF, #D8E3FF, "2");
  numButtons[3] = new Button(360, 276, 40, 32, #D8E3FF, #D8E3FF, "3");
  numButtons[4] = new Button(360, 308, 40, 32, #D8E3FF, #D8E3FF, "4");
  numButtons[5] = new Button(360, 340, 40, 32, #D8E3FF, #D8E3FF, "5");
  numButtons[6] = new Button(360, 372, 40, 32, #D8E3FF, #D8E3FF, "6");
  numButtons[7] = new Button(360, 404, 40, 32, #D8E3FF, #D8E3FF, "7");
  numButtons[8] = new Button(360, 436, 40, 32, #D8E3FF, #D8E3FF, "8");
  numButtons[9] = new Button(360, 468, 40, 32, #D8E3FF, #D8E3FF, "9");
  opButtons[0] = new Button(0, 0, 100, 80, #6981C1, #C2CEF0, "+");
  opButtons[1] = new Button(100, 0, 100, 80, #6981C1, #C2CEF0, "-");
  opButtons[2] = new Button(200, 0, 100, 80, #6981C1, #C2CEF0, "*");
  opButtons[3] = new Button(300, 0, 100, 80, #6981C1, #C2CEF0, "/");
  opButtons[4] = new Button(0, 420, 90, 80, #6981C1, #C2CEF0, "clear");
  opButtons[5] = new Button(90, 420, 90, 80, #6981C1, #C2CEF0, ".");
  opButtons[6] = new Button(180, 420, 90, 80, #6981C1, #C2CEF0, "=");
  opButtons[7] = new Button(270, 420, 90, 80, #6981C1, #C2CEF0, "+/-");
  opButtons[8] = new Button(0, 180, 90, 80, #A48CB9, #D2C5DE, "sqr");
  opButtons[9] = new Button(90, 180, 90, 80, #A48CB9, #D2C5DE, "sqrt");
  opButtons[10] = new Button(180, 180, 90, 80, #A48CB9, #D2C5DE, "^");
  opButtons[11] = new Button(270, 180, 90, 80, #A48CB9, #D2C5DE, "root");
  opButtons[12] = new Button(0, 260, 90, 80, #A48CB9, #D2C5DE, "sin");
  opButtons[13] = new Button(90, 260, 90, 80, #A48CB9, #D2C5DE, "cos");
  opButtons[14] = new Button(180, 260, 90, 80, #A48CB9, #D2C5DE, "tan");
  opButtons[15] = new Button(270, 260, 90, 80, #A48CB9, #D2C5DE, "pi");
  opButtons[16] = new Button(0, 340, 120, 80, #A48CB9, #D2C5DE, "log");
  opButtons[17] = new Button(120, 340, 120, 80, #A48CB9, #D2C5DE, "ln");
  opButtons[18] = new Button(240, 340, 120, 80, #A48CB9, #D2C5DE, "e^x");
}

void draw() {
  background(120);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
  if (mouseY>190) {
    if (mouseX >360) {
      fill(255, 0, 0, 63);
      rect(360, mouseY-10, 40, 32);
    }
  }
}

void updateDisplay() {
  fill(120);
  rect(0, 80, 400, 100);
  textSize(20);
  fill(255);
  textAlign(RIGHT);
  text(displayValue, width-50, 142);
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && displayValue.length()<26) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }

  println("L:" +l +" R:" + r +" Op:" + op);
  println("Result:" + result +" Left:" + left);
}
void keyPressed() {
  println("Key:" + key +"Keycode" + keyCode);
  if (key == '0' && displayValue.length() < 26) {
    handleEvent("0", true);
  } else if (key == '1' && displayValue.length() < 26) {
    handleEvent("1", true);
  } else if (key == '2' && displayValue.length() < 26) {
    handleEvent("2", true);
  } else if (key == '3' && displayValue.length() < 26) {
    handleEvent("3", true);
  } else if (key == '4' && displayValue.length() < 26) {
    handleEvent("4", true);
  } else if (key == '5' && displayValue.length() < 26) {
    handleEvent("5", true);
  } else if (key == '6' && displayValue.length() < 26) {
    handleEvent("6", true);
  } else if (key == '7' && displayValue.length() < 26) {
    handleEvent("7", true);
  } else if (key == '8' && displayValue.length() < 26) {
    handleEvent("8", true);
  } else if (key == '9' && displayValue.length() < 26) {
    handleEvent("9", true);
  } else if (key == ' ') {
    handleEvent("clear", false);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("*", false);
  } else if (key == '/') {
    handleEvent("/", false);
  } else if (key == RETURN || key == ENTER) {
    handleEvent("=", false);
  } else if (key == '_') {
    handleEvent("+/-", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == '@') {
    handleEvent("sqr", false);
  } else if (key == 'v') {
    handleEvent("sqrt", false);
  } else if (key == '^') {
    handleEvent("^", false);
  } else if (key == 'r') {
    handleEvent("root", false);
  }
}

String handleEvent(String val, boolean num) {
  if (left && num) {
    if (displayValue.equals("0") || result == l) { //" " what calculator starts at
      if (val.equals(".")) {
        displayValue += (val);
        l = float(displayValue);
      } else {
        displayValue = (val);
        l = float(displayValue);
      }
    } else {
      displayValue += (val);
      l = float(displayValue);
    }
  } else if (!left && num) {
    if (displayValue.equals("0") || displayValue.equals(op) || result == r) {     
      if (displayValue.contains(".")) {
        displayValue += (val);
        r = float(displayValue);
      } else {
        displayValue = (val);
        r = float(displayValue);
      }
    } else {
        displayValue += (val);
        r = float(displayValue);
    }
  } else if (val.equals("clear")) {
    displayValue = "0";
    result = 0;
    left = true;
    r = 0;
    l = 0;
    op = "";
  } else if (val.equals("+")) {
    if (!left) {    
      performCalc();
    } else {
      op = "+";
      left = false;      
      displayValue = "+";
    }
  } else if (val.equals("-")) {
    if (!left) {
      performCalc();
    } else {
      op = "-";
      left = false;
      displayValue = "-";
    }
  } else if (val.equals("*")) {
    if (!left) {
      performCalc();
    } else {
      op = "*";
      left = false;
      displayValue = "*";
    }
  } else if (val.equals("/")) {
    if (!left) {
      performCalc();
    } else {
      op = "/";
      left = false;
      displayValue = "/";
    }
  } else if (val.equals("=")) {
    performCalc();
  } else if (val.equals("+/-")) {
    if (left) {
      l *= -1;
      displayValue = str(l);
    } else {
      r *= -1;
      displayValue = str(r);
    }
  } else if (val.equals(".") && !displayValue.contains(".")) {
    displayValue += (val);
  } else if (val.equals("sqr")) {
    if (!left) {
      performCalc();
    } else {
      op = "sqr";
      left = false;
      displayValue = "sqr";
    }
  } else if (val.equals("sqrt")) {
    if (!left) {
      performCalc();
    } else {
      op = "sqrt";
      left = false;
      displayValue = "sqrt";
    }
  } else if (val.equals("^")) {
    if (!left) {
      performCalc();
    } else {
      op = "^";
      left = false;
      displayValue = "^";
    }
  } else if (val.equals("root")) {
    if (!left) {
      performCalc();
    } else {
      op = "root";
      left = false;
      displayValue = "root";
    }
  } else if (val.equals("pi")) {
    displayValue = ("3.14");
    l = PI;
  } else if (val.equals("sin")) {
    if (!left) {
      performCalc();
    } else {
      op = "sin";
      left = false;
      displayValue = "sin";
    }
  } else if (val.equals("cos")) {
    if (!left) {
      performCalc();
    } else {
      op = "cos";
      left = false;
      displayValue = "cos";
    }
  } else if (val.equals("tan")) {
    if (!left) {
      performCalc();
    } else {
      op = "cos";
      left = false;
      displayValue = "cos";
    }
  } else if (val.equals("log")) {
    if (!left) {
      performCalc();
    } else {
      op = "log";
      left = false;
      displayValue = "log";
    }
  } else if (val.equals("ln")) {
    if (!left) {
      performCalc();
    } else {
      op = "ln";
      left = false;
      displayValue = "ln";
    }
  } else if (val.equals("e^x")) {
    if (!left) {
      performCalc();
    } else {
      op = "e^x";
      left = false;
      displayValue = "e^x";
    }
  } 
  return val;
}


void performCalc() {
  if (op.equals("+")) {
    result = l+r;
  } else if (op.equals("-")) {
    result = l-r;
  } else if (op.equals("*")) {
    result = l*r;
  } else if (op.equals("/")) {
    result = l/r;
  } else if (op.equals("sqr")) {
    result = sq(l);
  } else if (op.equals("sqrt")) {
    result = sqrt(l);
  } else if (op.equals("^")) {
    result = pow(l, r);
  } else if (op.equals("root")) {
    result = pow(l, 1/r);
  } else if (op.equals("sin")) {
    float deg = l;
    float rad = radians(deg);
    result = sin(rad);
  } else if (op.equals("cos")) {
    float deg = l;
    float rad = radians(deg);
    result = cos(rad);
  } else if (op.equals("tan")) {
    float deg = l;
    float rad = radians(deg);
    result = tan(rad);
  } else if (op.equals("log")) {
    result = (log(l) / log(10));
  } else if (op.equals("ln")) {
    result = log(l);
  } else if (op.equals("e^x")) {
    result = (exp(l));
  } 
  l = result;
  displayValue = str(result);
  left = true;
}
