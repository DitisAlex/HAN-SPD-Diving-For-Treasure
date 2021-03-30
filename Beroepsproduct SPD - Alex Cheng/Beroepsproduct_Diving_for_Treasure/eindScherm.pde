void eindScherm() {
  if (gameState == 5) {
    background(tb2);
    textAlign(CENTER, CENTER);
    textSize(20);
    tekenKnoppen(2, "Return to home screen");

    if (tweedeSpeler == false) {
      gameoverSpeler1();
    } else {
      gameoverSpeler2();
    }
  }
}

void gameoverSpeler1() {
  textSize(width/9);
  kopTekst("Game Over", height/8, width/2);
  textSize(width/15);
  kopTekst("Final Score: " + score1, height/2, width/2);
}

void gameoverSpeler2() {
  textSize(height/5);
  if (score1 > score2) {
    kopTekst("Player 1 wins!", height/8, width/2);
  } 
  if (score1 == score2) {
    if (lives1 > lives2) {
      kopTekst("Player 1 wins", height/8, width/2);
    } else {
      kopTekst("Player 2 wins", height/8, width/2);
    }
  } else {
    kopTekst("Player 2 wins!", height/8, width/2);
  }

  textSize(width/15);
  kopTekst("Player 1", height/3, width/4);
  kopTekst("Player 2", height/3, width-width/4);

  int tekstGrootte = width/20;
  textSize(tekstGrootte);

  kopTekst("Final Score: " + score1, height/2, width/4);
  kopTekst("Final score: " + score2, height/2, width-width/4);
  kopTekst("Lives remaining: " + lives1, height/2 + tekstGrootte, width/4);
  kopTekst("Lives remaining: " + lives2, height/2 + tekstGrootte, width-width/4);
}
