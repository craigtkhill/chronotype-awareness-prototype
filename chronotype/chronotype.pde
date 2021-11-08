import uibooster.*;

UiBooster booster;

int rowNumber;

int score;
float variableNumber;
float totalScore;

String question;
String description;
Integer min;
Integer max;
Integer start;
Integer tick1;
Integer tick2;

Integer idealWakeUpTime;
Integer idealSleepTime;
Integer alarmDependence;

Table table;

void setup() {
  size(400, 850);
  background(#112233);

  booster = new UiBooster();

  table = loadTable("data/questions.csv", "header");

  println(table.getRowCount() + " total rows in table");
  
  rowNumber = 0;
}

void draw() {
  background(#112233);
  getData(rowNumber);
  rowNumber += 1;
  slider(question, description, min, max, start, tick1, tick2);
  
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Progress " + totalScore / variableNumber, width/2, height/2);

  // if rowNumber > table.getColumnCount() then display splashscreen

}

void getData(int rowNumber) {
  question = table.getString(rowNumber, "question");
  description = table.getString(rowNumber, "description");
  min = table.getInt(rowNumber, "min");
  max = table.getInt(rowNumber, "max");
  start = table.getInt(rowNumber, "start");
  tick1 = table.getInt(rowNumber, "tick1");
  tick2 = table.getInt(rowNumber, "tick2");
}

void slider(String question, String description, int min, int max, int start, int tick1, int tick2) {
  score = booster.showSlider(question, description, min, max, start, tick1, tick2);
  totalScore += score;
  variableNumber +=1;
}
