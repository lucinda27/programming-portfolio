import java.util.Scanner;
import java.util.Random;
import java.lang.Math;
class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    Random r = new Random();
    int marbles = r.nextInt(90)+10, player = 0, computer = 0, input = 0, t=0;
    boolean yourTurn = r.nextBoolean();
    boolean smart = r.nextBoolean();
    if (smart) {
      System.out.println("computer mode: smart");
    } else {
      System.out.println("computer mode: stupid");
    }
    while (marbles>0) {
      if (yourTurn) {
        if (marbles==1) {
            System.out.println("There is " + marbles+ " marble. How many do you take?");
            input = scan.nextInt();
          } else {
            System.out.println("There are " + marbles+ " marbles. How many do you take?");
            input = scan.nextInt();
          } 
        if (input<=marbles/2 || input==1) {
          player = input;
        } else {
          System.out.println("The most marbles you can take is "+ marbles/2 + ". How many do you take?");
          player = scan.nextInt();
        }
        marbles -= player;
        if (marbles==0) {
              System.out.println("You lost.");
            }
        yourTurn=false;
      } else {
          if (smart) {
            t=6;
            while(t>0) {
              if (marbles >= Math.pow(2,t)) {
                computer = marbles - (int)Math.pow(2,t) + 1;
                if (computer > marbles/2) {
                  if (marbles==1) {
                    computer=1;
                  } else {
                    computer = r.nextInt((marbles/2));
                    if (computer == 0) {
                      computer++;              
                    }
                  }
                }
                t=0;
              }
              t--;
            }
          } else { //stupid computer
            if (marbles==1) {
              computer=1;
            } else {
              computer = r.nextInt((marbles/2));
              if (computer == 0) {
                computer++;              
              }
            }
          }
          marbles-=computer;
          if (computer==1) {
            System.out.println("The computer took "+ computer + " marble.");
          } else {
            System.out.println("The computer took "+ computer + " marbles.");
          }
          if (marbles==0) {
            System.out.println("The computer lost.");
          }
          yourTurn=true;
      }
    }
    scan.close();
  }
}