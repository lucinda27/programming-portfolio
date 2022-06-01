class TestScore implements Ranking {
  private int score;
  private String student;

  public TestScore(int s, String st) {
    score=s;
    student=st;
  }

  public int getValue() {
    return score;
  }
  
  public String getName() {
    return student;
  }
  
}