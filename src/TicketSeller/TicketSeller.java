import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    String ticket = "", number = "", selection = "", again = "";
    int row = 0, num = 0, price = 0;
    boolean selecting = true;
    int[][] tickets = {
      {10, 10, 10, 10, 10, 10, 10, 10, 10, 10},
      {10, 10, 10, 10, 10, 10, 10, 10, 10, 10},
      {10, 10, 10, 10, 10, 10, 10, 10, 10, 10},
      {10, 10, 20, 20, 20, 20, 20, 20, 10, 10},
      {10, 10, 20, 20, 20, 20, 20, 20, 10, 10},
      {10, 10, 20, 20, 20, 20, 20, 20, 10, 10},
      {20, 20, 30, 30, 40, 40, 30, 30, 20, 20},
      {20, 30, 30, 40, 50, 50, 40, 30, 30, 20},
      {30, 40, 50, 50, 50, 50, 50, 50, 40, 30}
    };
    String[] labels = {"A", "B", "C", "D", "E", "F", "G", "H", "I"};
    while (selecting) {
      System.out.println("Would you like to select a seat by position or price?");
      selection = scan.next();
      selection.toLowerCase();
      if (selection.contains("position")) {
        boolean ag = true;
        while (ag) {
          System.out.println("Please select a seat from rows A-I, numbered 1-10. example: F4");
          ticket = scan.next();
          ticket.toUpperCase();
          for (int i=0; i<labels.length; i++) {
            if (ticket.contains(labels[i])) {
              int pos = ticket.indexOf(labels[i]);
              if (ticket.length() > 2) {
                ticket = ticket.substring(pos, pos+3);
                number = ticket.substring(pos+1, pos+3);
              } else {
                ticket = ticket.substring(pos, pos+2);
                number = ticket.substring(pos+1, pos+2);
              }
              row=i;
            }
          }
          num = Integer.parseInt(number);
          num--;
          if (tickets [row][num] == 0) {
            ag = true;
            System.out.println("That seat isn't available.");
          } else {
            ag = false;
          }
        }
        tickets [row][num] = 0;
        System.out.println(ticket + " is your seat number.");
      } else if (selection.contains("price")) {
          System.out.println("Please select a price ranging from $10 to $50. example: 20"); 
          if (scan.hasNextInt()) {
            price = scan.nextInt();
            System.out.println(price);
            for (int i = 0 ; i < 10; i++) {
              for(int j = 0 ; j < 9 ; j++) {
                if ( tickets[i][j] == price) {
                  tickets[i][j] = 0;
                  j++;
                  System.out.println("Your seat number is " + labels[i] + j);
                  i=10;
                  j=9;
                }
              }
            }
          } 
      } else {
        selecting=false;
      } 
      System.out.println("Would you like to select another seat?");
      again = scan.next();
      again.toLowerCase();
      if (again.contains("y")) {
        selecting = true;
      } else {
        selecting = false;
      }
    }
    scan.close();
  }
}