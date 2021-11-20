import uibooster.*;
import controlP5.*;

ControlP5 cp5;
UiBooster booster;

// Score Variables
int score;
float totalScore;
float maxScore;
int [] newAndMaxScore;

// Morning-Evening Scale Variables
Table MORNING_EVENING_SCALE;
int currentRowNumber = 0;
int TOTAL_ROW_NUMBER;
String question;
String description;
Integer minValue;
Integer manValue;
Integer defaultStartPosition;
Integer stepTickValue;
Integer stepForTicks;
String scale;

// Images
PImage BACKGROUND_IMAGE;
PImage MORNING_LARK;
PImage NIGHT_OWL;
PImage HUMMINGBIRD;

void setup() {
  // Setup to approximate a mobile device size
  size(400, 850);
  background(#112233);

  booster = new UiBooster();
  cp5 = new ControlP5(this);

  // Load the table containing all the question data
  MORNING_EVENING_SCALE = loadTable("data/questions.csv", "header");
  
  // Used to check when all the rows have been iterated through
  TOTAL_ROW_NUMBER = MORNING_EVENING_SCALE.getRowCount();

  // Load the images
  BACKGROUND_IMAGE = loadImage("images/background.png");
  MORNING_LARK = loadImage("images/morning_lark.png");
  NIGHT_OWL = loadImage("images/night_owl.png");
  HUMMINGBIRD = loadImage("images/hummingbird.png");

  // Draw the main background image to the screen
  image(BACKGROUND_IMAGE, CENTER, CENTER);
}

void draw() {
  // if there are still questions to be displayed 
  if (currentRowNumber < TOTAL_ROW_NUMBER) {
    
    // get the data from the next row
    getData(currentRowNumber);
    
    // ask the user to answer the question and return an array 
    // with the answer with the max possible score
    newAndMaxScore = slider(question, description, 
                            minValue, manValue, 
                            defaultStartPosition, 
                            stepTickValue, stepForTicks, 
                            scale);
    
    // increment the variables with the new scores
    totalScore += newAndMaxScore[0];
    maxScore += newAndMaxScore[1];
    
    // Then update the slider showing the degree 
    // to which the person is a night owl or morning lark
    showSlider(totalScore, maxScore);
  }
}
