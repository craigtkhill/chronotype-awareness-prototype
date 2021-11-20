void getData(int rowNumber) {
  // check that the row number is not greater than the total number of rows
  if (rowNumber < TOTAL_ROW_NUMBER) {
    // Get all the data from the morning-eveningness scale csv and store them in variables
    question = MORNING_EVENING_SCALE.getString(rowNumber, "question");
    description = MORNING_EVENING_SCALE.getString(rowNumber, "description");
    minValue = MORNING_EVENING_SCALE.getInt(rowNumber, "min");
    manValue= MORNING_EVENING_SCALE.getInt(rowNumber, "max");
    defaultStartPosition = MORNING_EVENING_SCALE.getInt(rowNumber, "start");
    stepTickValue = MORNING_EVENING_SCALE.getInt(rowNumber, "tick1");
    stepForTicks = MORNING_EVENING_SCALE.getInt(rowNumber, "tick2");
    scale = MORNING_EVENING_SCALE.getString(rowNumber, "scale");
  }
}
// Use these variables to update the UI Booster slider
int [] slider(String question, String description, int minValue, int manValue, int defaultStartPosition, int tick1, int tick2, String scale) {
  score = booster.showSlider(question, description, minValue, manValue, defaultStartPosition, tick1, tick2);
  
  // Initialise a new score and max score to zero
  Integer newScore = 0;
  Integer maxScore = 0;

  // Transform the scores depending on the data
  
  // 24 hours scale inversed
  if (manValue== 24 && scale.equals("inverse")) {
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

  // 24 hours scale normal
  else if (manValue == 24 && scale.equals("normal")) {
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
    
    // Likert scale inversed
  } else if (manValue == 4 && scale.equals("inverse")) {
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
    
    //Likert scale normal
  } else {
    maxScore = 4;
    newScore = score;
  }
  
  // If the end of the rows is not reached increment the row number by 1
  if (currentRowNumber < 19) {
    currentRowNumber += 1;
  }
  // return the new score and the max score
  return new int [] {newScore, maxScore};
}
