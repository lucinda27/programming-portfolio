class RaceTime implements Ranking {
  private int time;
  private String athlete;

  public RaceTime(int t, String a) {
    time=t;
    athlete=a;
  }
  
  public int getValue() {
    return time;
  }
  
  public String getName() {
    return athlete;
  }

}