import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

class Main {
  public static void main(String[] args) throws FileNotFoundException {
    File beowulfText = new File("Beowulf");
    Scanner scan = new Scanner(beowulfText);
    PrintWriter output = new PrintWriter("beowulfCount");
    scan.useDelimiter(""); 
    int ðCount = 0;
    int þCount = 0;

    while (scan.hasNextLine()) {
      char c = scan.next().charAt(0);
      if (c=='ð') {
        ðCount++;
      }
      if (c=='þ') {
        þCount++;
      }
    }
   
    output.println("The character ð appears " + ðCount + " times and the character þ appears " + þCount + " times in the entire original text of Beowulf.");
    scan.close();
    output.close();
  }
}