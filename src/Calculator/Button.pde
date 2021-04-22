class Button {
  // Member Variable
  int x, y, w, h;
  color cl, cl2;
  String val;
  boolean hover;
  
  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, int tempColor, int temp2Color, String tempVal) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    cl = tempColor;
    cl2 = temp2Color;
    val = tempVal;
    hover = false;
  }

  // Display Method
  void display() { 
    if (hover) {
      fill(cl2);
    } else {
      fill(cl);
    }
    rect(x, y, w, h);
    fill(0);
    text(val, x+(w*2/3), y+(h*2/3));
  }


  // Hover Method
  void hover(int mx, int my) {
    hover = (mx>x && my>y && mx<x+w && my<y+h);
  }
}
