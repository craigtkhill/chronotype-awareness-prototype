void showSlider(float totalScore, float maxScore) {
  // Updates the slider showing the morning-eveningness of the user
  int percentage = round(totalScore / maxScore * 100);
 
 // Create the slider
  cp5.addSlider("")
    .setPosition(100, 600)
    .setSize(200, 20)
    .setRange(0, 100)
    .setValue(percentage)
    .setColorValue(color(0))
    .setColorActive(color(145, 107, 191))
    .setColorForeground(color(28, 12, 91))
    .setColorBackground(color(201, 150, 204));

  // If the end of the questions is reached
  // A screen will be displayed providing the user 
  // with information about their chronotype
  if (currentRowNumber >= TOTAL_ROW_NUMBER) {
    if (percentage > 60) {
      image(MORNING_LARK, CENTER, CENTER);
    } else if (percentage > 50) {
      image(HUMMINGBIRD, CENTER, CENTER);
    } else {
      image(NIGHT_OWL, CENTER, CENTER);
    }
  }
}
