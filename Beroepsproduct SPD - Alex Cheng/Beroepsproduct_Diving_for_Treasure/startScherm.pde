final int KLEUR1 = #EBD634;
int marge;
int knopPositieX;
int knopPositieY;
int knopBreedte;
int knopHoogte;
int textHoogte;

void startScherm() {
  if (gameState == 0) {
    background(tb); 
    marge = height / 4;
    knopBreedte = width/4;
    knopHoogte = height/8;
    knopPositieX = width/2;
    knopPositieY = height / 4;
    textHoogte = height/7;
    textAlign(CENTER, CENTER);
    textSize(width/30);

    kopTekst("Welcome to Diving for Treasure!", height/7, knopPositieX);
    tekenKnoppen(0, "Start Game");
    tekenKnoppen(1, "Settings");
    tekenKnoppen(2, "Exit Game");
  }
}

void tekenKnoppen(float knopNum, String knopText) {
  rectMode(CENTER);
  fill(KLEUR1);
  rect(knopPositieX, knopPositieY+knopNum*marge, knopBreedte, knopHoogte, 7);
  fill(0);
  text(knopText, knopPositieX, knopPositieY+knopNum*marge);
}

void kopTekst(String tekst, float textHoogte, float textBreedte) {
  fill(0);
  for (int x = -1; x < 2; x++) {
    text(tekst, textBreedte+x, textHoogte);
    text(tekst, textBreedte, textHoogte+x);
  }
  fill(KLEUR1);
  text(tekst, textBreedte, textHoogte);
}
