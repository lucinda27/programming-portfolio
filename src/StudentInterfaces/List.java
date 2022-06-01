import java.util.Arrays;

public class List {
   public static String list(Ranking[] objects) {
    int count = 0;
    String list = "";
    final int LENGTH = 4;
    String[] prevNames = new String[LENGTH];
    String[] newNames = new String[LENGTH];
    int[] prevValues = new int[LENGTH];
    int[] newValues = new int[LENGTH];
    for (Ranking obj : objects) {
      prevValues[count] = obj.getValue();
      prevNames[count] = obj.getName();
      count++;
    }
     
    for (int i=0; i<prevValues.length; i++) {
      newValues[i] = prevValues[i];
    }

     Arrays.sort(newValues);

    int k=0;
    for (int i : newValues) {
      for (int j=0; j<prevValues.length; j++) {
        if (prevValues[j] == i) {
          newNames[k] = prevNames[j];
        }
      }
      k++;
    }


    for (String l : newNames) {
      list = list + l + ", ";
    }
    return list;
   }
}