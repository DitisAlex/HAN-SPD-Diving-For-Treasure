int[][] spawnCoins = new int [maxCoins][2];
int[][] spawnMines = new int [maxMines][2];
int[][] spawnOxygen = new int [maxOxygen][2];

int lives1 = 3; //lives speler 1
int lives2 = 3; //lives speler 2
int score1; //score speler 1
int score2; //score speler 2
int puntenAftrek = 100;
int oxygenTime = 30; 
int oxygen1;
int oxygenTime2 = 30;
int oxygen2;
boolean tijdReset = false;
int textMargeX = 10;
float diameter = 50; // grootte spelers
float spawnX1 = 350; // positie X speler 1
float spawnY1 = diameter/2; //positie Y speler 1
float spawnX2 = 600; //positie X speler 2
float spawnY2 = diameter/2; // positie Y speler 1
float beginSpawnY1 = spawnY1;
float beginSpawnY2 = spawnY2;
int snelheid = 4; //bewegings snelheid spelers
boolean oppakken1 = false; //oppakken speler 1
boolean oppakken2 = false; //oppakken speler 2

final int KLEURSPELER1 = #ebc334;
final int KLEURSPELER2 = #eb3449;

char[] keyChars = {
  'a', 'A', 
  'd', 'D', 
  'w', 'W', 
  's', 'S', 
  'x', 'X', 
};

int[] keycodeChars = {
  LEFT, 
  RIGHT, 
  UP, 
  DOWN, 
  ALT, 
};

boolean[] keys = new boolean[keyChars.length / 2 + keycodeChars.length];

void spelScherm() {
  if (gameState == 4) {
    background(tb3);
    imageMode(CENTER);
    image(boat, width/2, height/9);

    if (tijdReset == false) {

      if (tweedeSpeler == true) {
      }
      tijdReset = true;
    }

    speelschermTekst("Speler ", 1, textMargeX, LEFT, 1, KLEURSPELER1);
    speelschermTekst("Lives: ", 2.5, textMargeX, LEFT, lives1, KLEURSPELER1 );
    speelschermTekst("Score: ", 3.5, textMargeX, LEFT, score1, KLEURSPELER1);
    speelschermTekst("Oxygen time remaining: ", 5, textMargeX, LEFT, oxygen1, KLEURSPELER1);

    if (tweedeSpeler == true) {
      speelschermTekst("Speler ", 1, width, RIGHT, 2, KLEURSPELER2);
      speelschermTekst("Lives: ", 2.5, width, RIGHT, lives2, KLEURSPELER2);
      speelschermTekst("Score: ", 3.5, width, RIGHT, score2, KLEURSPELER2);
      speelschermTekst("Oxygen time remaining: ", 5, width, RIGHT, oxygen2, KLEURSPELER2);
    }

    balBeweging();
    spawnMuntjes(spawnCoins);
    spawnVallen(spawnMines);
    spawnZuurstof(spawnOxygen);

    zuurstofTeller();
    scoreTeller();
    levenTeller();
  }
}


void speelschermTekst(String displayText, float tekstNum, int reverse, int tekstMode, int displayVar, int kleur) {

  textMarge = 30;
  textSize(textMarge);

  fill(255);
  textAlign(tekstMode);

  fill(0);
  for (int x = -1; x < 2; x++) {
    text(displayText + displayVar, reverse-textMargeX+x, tekstNum*textMarge);
    text(displayText + displayVar, reverse-textMargeX, tekstNum*textMarge+x);
  }
  fill(kleur);
  text(displayText + displayVar, reverse-textMargeX, tekstNum*textMarge);
}

void tekenSpeler() {

  fill(KLEURSPELER1);
  circle(spawnX1, spawnY1, diameter);
  fill(255);
  circle(spawnX1, spawnY1, diameter*0.7);

  if (tweedeSpeler == true) {
    fill(KLEURSPELER2);
    circle(spawnX2, spawnY2, diameter);
    fill(255);
    circle(spawnX2, spawnY2, diameter*0.7);
  }
}

void balBeweging() {
  int deltaX = 0; 
  int deltaY = 0; //beweging speler 1
  int deltaX2 = 0; 
  int deltaY2 = 0;// beweging speler 2

  if (keys[0]) { //A
    deltaX--;
  } 
  if (keys[1]) { //D
    deltaX++;
  } 
  if (keys[2]) { //W
    deltaY--;
  } 
  if (keys[3]) { //S
    deltaY++;
  } 
  if (keys[4]) { //X
    oppakken1 = true;
  } 
  if (keys[5]) { //Left Arrow
    deltaX2--;
  } 
  if (keys[6]) { //Right Arrow
    deltaX2++;
  } 
  if (keys[7]) { //Up
    deltaY2--;
  } 
  if (keys[8]) { //Down
    deltaY2++;
  } 
  if (keys[9]) { //Alt
    oppakken2 = true;
  }

  if (deltaX == 1 && spawnX1 + diameter / 2 > width ) {
    deltaX = 0;
  } 
  if (deltaX == -1 && spawnX1 + diameter / 2 < diameter) {
    deltaX = 0;
  } 
  if (deltaY == 1 && spawnY1 + diameter/2 > height) {
    deltaY = 0;
  } 
  if (deltaY == -1 && spawnY1 + diameter/2 < diameter) {
    deltaY = 0;
  } 
  if (deltaX2 == 1 && spawnX2 + diameter / 2 > width ) {
    deltaX2 = 0;
  } 
  if (deltaX2 == -1 && spawnX2 + diameter / 2 < diameter) {
    deltaX2 = 0;
  } 
  if (deltaY2 == 1 && spawnY2 + diameter/2 > height) {
    deltaY2 = 0;
  } 
  if (deltaY2 == -1 && spawnY2 + diameter/2 < diameter) {
    deltaY2 = 0;
  }

  deltaX = deltaX * snelheid; 
  deltaY = deltaY * snelheid; //bewegingsnelheid speler 1
  deltaX2 = deltaX2 * snelheid; 
  deltaY2 = deltaY2 * snelheid; //bewegingsnelheid speler 2

  spawnX1 += deltaX;  
  spawnY1 += deltaY;
  spawnX2 += deltaX2;  
  spawnY2 += deltaY2;

  tekenSpeler();
}
void keyPressed() {
  for (int i = 0; i < keyChars.length/2; i++) {
    if (key == keyChars[i*2] || key == keyChars[i*2+1])
      keys[i] = true;
  }

  for (int i=0; i < keycodeChars.length; i++) {
    if (keyCode == keycodeChars[i])
      keys[keyChars.length/2+i] = true;
  }
}

void keyReleased() {
  for (int i = 0; i < keyChars.length/2; i++) {
    if (key == keyChars[i*2] || key == keyChars[i*2+1])
      keys[i] = false;
  }

  for (int i=0; i < keycodeChars.length; i++) {
    if (keyCode == keycodeChars[i])
      keys[keyChars.length/2+i] = false;
  }
}

void spawnMuntjes(int cordCircles[][]) {
  for (int i=0; i < spawnCoins.length; i++) {        
    image(coin, cordCircles[i][0], cordCircles[i][1]);
    cordCircles[i][1] = cordCircles[i][1] - snelheid/2;
    if (cordCircles[i][1] < 0) {
      cordCircles[i][0] = ceil(random(0+diameter, width-diameter));
      cordCircles[i][1] = ceil(random(height/2, height-diameter));
    }
  }
}

void spawnVallen(int cordCircles[][]) {
  for (int i=0; i < spawnMines.length; i++) {        
    image(mine, cordCircles[i][0], cordCircles[i][1]);
    cordCircles[i][1] = cordCircles[i][1] - snelheid;
    if (cordCircles[i][1] < 0) {
      cordCircles[i][0] = ceil(random(0+diameter, width-diameter));
      cordCircles[i][1] = ceil(random(height/2, height-diameter));
    }
  }
}

void spawnZuurstof(int cordCircles[][]) {
  for (int i=0; i < spawnOxygen.length; i++) {        
    image(oxygen, cordCircles[i][0], cordCircles[i][1]);
    cordCircles[i][1] = cordCircles[i][1] - snelheid/4;
    if (cordCircles[i][1] < 0) {
      cordCircles[i][0] = ceil(random(0+diameter, width-diameter));
      cordCircles[i][1] = ceil(random(height/2, height-diameter));
    }
  }
}

void maakItemCoin (int cordCircles[][]) {
  for (int i=0; i < spawnCoins.length; i++) {        
    cordCircles[i][0] = ceil(random(0+diameter, width-diameter));
    cordCircles[i][1] = ceil(random(height/2, height-diameter));
  }
}

void maakItemMine(int cordCircles[][]) {
  for (int i=0; i < spawnMines.length; i++) {        
    cordCircles[i][0] = ceil(random(0+diameter, width-diameter));
    cordCircles[i][1] = ceil(random(height-height/10, height-diameter));
  }
}

void maakItemZuurstof(int cordCircles[][]) {
  for (int i=0; i < spawnOxygen.length; i++) {        
    cordCircles[i][0] = ceil(random(0+diameter, width-diameter));
    cordCircles[i][1] = ceil(random(height/2, height-diameter));
  }
}

void scoreTeller() {
  int score = ceil(random(10, 100));
  for (int i=0; i<spawnCoins.length; i++) {

    if (oppakken1 == true && spawnX1 + diameter/2>= spawnCoins[i][0] && spawnX1 - diameter/2<= spawnCoins[i][0] && 
      spawnY1 + diameter/2 >= spawnCoins[i][1] && spawnY1 - diameter/2 <= spawnCoins[i][1]) {

      spawnCoins[i][0] = ceil(random(0+diameter, width-diameter));
      spawnCoins[i][1] = ceil(random(height/2, height-diameter));
      score1 = score1 + score;
      oppakken1 = false;
    }

    if (tweedeSpeler == true) {
      if (oppakken2 == true && spawnX2 + diameter/2>= spawnCoins[i][0] && spawnX2 - diameter/2<= spawnCoins[i][0] && 
        spawnY2 + diameter/2 >= spawnCoins[i][1] && spawnY2 - diameter/2 <= spawnCoins[i][1]) {

        spawnCoins[i][0] = ceil(random(0+diameter, width-diameter));
        spawnCoins[i][1] = ceil(random(height/2, height-diameter));
        score2 = score2 + score;
      }
    }
  }
}

void levenTeller() {
  for (int i=0; i<spawnMines.length; i++) {
    if (spawnX1 + diameter/2>= spawnMines[i][0] && spawnX1 - diameter/2<= spawnMines[i][0] && 
      spawnY1 + diameter/2 >= spawnMines[i][1] && spawnY1 - diameter/2 <= spawnMines[i][1]) {

      spawnMines[i][0] = ceil(random(0+diameter, width-diameter));
      spawnMines[i][1] = ceil(random(height-height/10, height-diameter));
      lives1--;
      score1 = score1 - puntenAftrek;
      spawnY1 = beginSpawnY1;
    }

    if (tweedeSpeler == true) {
      if (spawnX2 + diameter/2>= spawnMines[i][0] && spawnX2 - diameter/2<= spawnMines[i][0] && 
        spawnY2 + diameter/2 >= spawnMines[i][1] && spawnY2 - diameter/2 <= spawnMines[i][1]) {

        spawnMines[i][0] = ceil(random(0+diameter, width-diameter));
        spawnMines[i][1] = ceil(random(height-height/10, height-diameter));
        lives2--;
        score2 = score2 - puntenAftrek;
        spawnY2 = beginSpawnY2;
      }
    }
    if (lives1 == 0 || lives2 == 0) {
      gameState = 5;
    }
  }
}

void zuurstofTeller() {
  int tijd = millis()/1000;
  int tijd2 = millis()/1000;
  oxygen1 = abs(tijd-oxygenTime);
  oxygen2 = abs(tijd2-oxygenTime2);

  if (oxygen1 == 0 || oxygen2 == 0) {
    gameState = 5;
  }

  for (int i=0; i<spawnOxygen.length; i++) {

    if (spawnX1 + diameter/2>= spawnOxygen[i][0] && spawnX1 - diameter/2<= spawnOxygen[i][0] && 
      spawnY1 + diameter/2 >= spawnOxygen[i][1] && spawnY1 - diameter/2 <= spawnOxygen[i][1]) {

      oxygenTime=abs(tijd+30);

      spawnOxygen[i][0] = ceil(random(0+diameter, width-diameter));
      spawnOxygen[i][1] = ceil(random(height/2, height-diameter));
    }
    if (spawnX2 + diameter/2>= spawnOxygen[i][0] && spawnX2 - diameter/2<= spawnOxygen[i][0] && 
      spawnY2 + diameter/2 >= spawnOxygen[i][1] && spawnY2 - diameter/2 <= spawnOxygen[i][1]) {

      oxygenTime2=abs(tijd2+30);

      spawnOxygen[i][0] = ceil(random(0+diameter, width-diameter));
      spawnOxygen[i][1] = ceil(random(height/2, height-diameter));
    }
  }
}
