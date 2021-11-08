import uibooster.*;
import controlP5.*;

ControlP5 cp5;
UiBooster booster;

int rowNumber;

int score;
float totalScore;
float maxPossibleScore;

String question;
String description;
Integer min;
Integer max;
Integer start;
Integer tick1;
Integer tick2;

Table table;

void setup() {
  size(400, 850);
  background(#112233);
  noStroke();


  cp5 = new ControlP5(this);
  booster = new UiBooster();

  table = loadTable("data/questions.csv", "header");

  println(table.getRowCount() + " total rows in table");

  rowNumber = 0;
}

void draw() {
  textAlign(CENTER, CENTER);
  textSize(36);
  background(#112233);

  getData(rowNumber);
  rowNumber += 1;
  slider(question, description, min, max, start, tick1, tick2); // we should use the ControlP5 library for the slider

  //text(question + "\n" + description, width/2, height/3);
  text("You are " + round((totalScore / maxPossibleScore) * 100) + "% Evening Owl", width/2, height/2);


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
  
  //cp5.addSlider("slider")
  //.setPosition(100, 305)
  //.setSize(200, 20)
  //.setRange(min, max)
  //.setValue(128);
  
  if (maxPossibleScore == 4) {
    score *= 6;
    max *=6;
  }
  totalScore += score;
  maxPossibleScore +=max;
}
