int gameState;
// 0 = main menu
// 1 = settings
// 2 = highscore
// 3 = startspel (uitleg scherm)
// 4 = startspel (spel zelf)
// 5 = eindScherm

void currentGameState() {
  startScherm();
  uitlegScherm(); 
  settingsScherm();
  spelScherm();
  eindScherm();
}

void mousePressed() {
  if (gameState == 0) {
    if (mouseX <= knopPositieX + knopBreedte / 2 && mouseX >= knopPositieX - knopBreedte / 2) {
      if (mouseY <= knopPositieY + knopHoogte / 2 && mouseY >= knopPositieY - knopHoogte / 2) {
        gameState = 3;
      } else if (mouseY <= (knopPositieY + marge) + knopHoogte / 2 && mouseY >= (knopPositieY + marge) - knopHoogte / 2) {
        gameState = 1;
      } else if (mouseY <= (knopPositieY + 2* marge) + knopHoogte / 2 && mouseY >= (knopPositieY + 2*marge) - knopHoogte / 2) {
        exit();
      }
    }
  }
  if (gameState == 1) {
    if (mouseX <= knopPositieX + knopBreedte / 2 && mouseX >= knopPositieX - knopBreedte / 2) {
      if (mouseY <= (knopPositieY + 2.5* marge) + knopHoogte / 2 && mouseY >= (knopPositieY + 2.5*marge) - knopHoogte / 2) {
        gameState = 0;
      }
    }
  }
  if (gameState == 3) {
    if (mouseX <= knopPositieX + knopBreedte / 2 && mouseX >= knopPositieX - knopBreedte / 2 && mouseY <= (knopPositieY + 2* marge) + knopHoogte / 2 && mouseY >= (knopPositieY + 2*marge) - knopHoogte / 2) {
      gameState = 4;
    }
  }
  if (gameState == 5) {
    if (mouseX <= knopPositieX + knopBreedte / 2 && mouseX >= knopPositieX - knopBreedte / 2 && mouseY <= (knopPositieY + 2* marge) + knopHoogte / 2 && mouseY >= (knopPositieY + 2*marge) - knopHoogte / 2) {
      gameState = 0;
      lives1 = 3; 
      lives2 = 3;
      score1 = 0; 
      score2 = 0;
    }
  }
}
