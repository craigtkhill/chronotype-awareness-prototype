import uibooster.*;
import controlP5.*;

ControlP5 cp5;
UiBooster booster;

int rowNumber;

int score;
float totalScore;
float maxPossibleScore;
int [] temp;

String question;
String description;
Integer min;
Integer max;
Integer start;
Integer tick1;
Integer tick2;
String scale;

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
  temp = slider(question, description, min, max, start, tick1, tick2, scale); // we should use the ControlP5 library for the slider
  totalScore += temp[0];
  maxPossibleScore += temp[1];
  int percentage = round(totalScore / maxPossibleScore * 100);
  if (percentage < 50) {
    text("You are more of a\nevening owl ", width/2, height/2);
  } else {
    text("You are more of a\nmorning lark ", width/2, height/2);
  }
  println(percentage);

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
  scale = table.getString(rowNumber, "scale");
}

int [] slider(String question, String description, int min, int max, int start, int tick1, int tick2, String scale) {
  score = booster.showSlider(question, description, min, max, start, tick1, tick2);
  Integer newScore = 0;
  Integer maxScore = 0;

  // Morning Scale 24 hours
  if (max == 24 && scale.equals("inverse")) {
    maxScore = 7;
    if (score > 14) {
      newScore = 1;
    } else if (score > 12 && score < 14) {
      newScore = 2;
    } else if (score > 10 && score < 12) {
      newScore = 3;
    } else if (score > 8 && score < 10) {
      newScore = 4;
    } else if (score > 6 && score < 8) {
      newScore = 5;
    } else if (score > 4 && score < 6) {
      newScore = 6;
    } else if (score < 4) {
      newScore = 7;
    }
  }

  // Evening Scale 24 hours
  else if (max == 24 && scale.equals("normal")) {
    maxScore = 7;
    if (score >= 2 && score < 4) {
      newScore = 1;
    } else if (score > 0 && score < 2) {
      newScore = 2;
    } else if (score > 22 && score < 24) {
      newScore = 3;
    } else if (score > 20 && score < 22) {
      newScore = 4;
    } else if (score > 18 && score < 20) {
      newScore = 5;
    } else if (score > 16 && score < 18) {
      newScore = 6;
    } else {
      newScore = 7;
    }
  } else if (max == 4 && scale.equals("inverse")) {
    maxScore = 4;
    if (score == 1) {
      newScore = 4;
    } else if (score == 2 ) {
      newScore = 3;
    } else if (score == 3) {
      newScore = 2;
    } else if (score == 4) {
      newScore = 1;
    }
  } else {
    maxScore = 4;
    newScore = score;
  }

  return new int [] {newScore, maxScore};
}


//cp5.addSlider("slider")
//.setPosition(100, 305)
//.setSize(200, 20)
//.setRange(min, max)
//.setValue(128);
