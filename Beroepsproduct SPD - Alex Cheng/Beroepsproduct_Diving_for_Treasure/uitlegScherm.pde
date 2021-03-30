int textAfstandY;
int textAfstandX;
int textMarge;

void uitlegScherm() {
  textAfstandY = height/9;
  textAfstandX = width/8;
  if (gameState == 3) {
    textMarge = 20;
    background(tb2);
    textAlign(CORNER, CORNER);
    textSize(textMarge);
    text("Your goal in this game is to collect as many coins as you can, ", textAfstandX, textAfstandY);
    text("while avoiding all mines in the water.", textAfstandX, textAfstandY + textMarge);

    text("You can simply change the amount of mines & coins in the settings tab.", textAfstandX, textAfstandY + (3*textMarge));

    text("Player 1 uses WASD to move around in the water,", textAfstandX, textAfstandY + (5*textMarge));
    text("and presses X to collect coins", textAfstandX, textAfstandY + (6*textMarge));

    text("Player 2 uses ARROW KEYS to move around in the water,", textAfstandX, textAfstandY + (8*textMarge));
    text("and presses ENTER to collect coins", textAfstandX, textAfstandY + (9*textMarge));

    text("Both the players have a total of 3 lives.", textAfstandX, textAfstandY + (11*textMarge));
    text("Beaware of your oxygen!", textAfstandX, textAfstandY + (13*textMarge));

    text("At the end you can see your final score,", textAfstandX, textAfstandY + (15*textMarge));
    text("additionally you have the option to save your highscore.", textAfstandX, textAfstandY + (16*textMarge));

    text("Best of luck!", textAfstandX, textAfstandY + (18*textMarge));

    textSize(25);
    textAlign(CENTER, CENTER);
    tekenKnoppen(2, "Continue to Game");
  }
}
