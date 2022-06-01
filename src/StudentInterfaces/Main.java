class Main {
  public static void main(String[] args) {
    Ranking[] athletes = new Ranking[4];
    athletes[0] = new RaceTime(65,"Jane");
    athletes[1] = new RaceTime(73,"Mary");
    athletes[2] = new RaceTime(54,"Grace");
    athletes[3] = new RaceTime(57,"Sarah");

    String athleteList = List.list(athletes);
    System.out.println(athleteList);

    Ranking[] students = new Ranking[4];
    students[0] = new TestScore(98,"Jane");
    students[1] = new TestScore(88,"Mary");
    students[2] = new TestScore(89,"Grace");
    students[3] = new TestScore(93,"Sarah");

    String studentList = List.list(students);
    System.out.println(studentList);
  }
}