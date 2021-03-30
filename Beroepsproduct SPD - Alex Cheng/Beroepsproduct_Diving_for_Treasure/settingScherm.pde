boolean tweedeSpeler = false;
float sliderX;
float sliderY;
float sliderBreedte;
float sliderHoogte;
int positie;
int positie2;
int positie3;
int nPosities;
int coinPositie;
int minimumMines = 3;
int minimumCoins = 4;
int maxCoins = positie + minimumCoins;
int maxMines = positie2 + minimumMines;
int maxPlayers;
int maxOxygen = 2;

void settingsScherm() {
  if (gameState == 1) {
    background(tb2);
    fill(0);
    text("Settings:", width/2, height/8);   
    tekenKnoppen(2.5, "Save Settings");
    Slider1();
    Slider2();
    Slider3();
    settingUpdate();
  }
}

void tekenSlider(float sliderX, float sliderY, float sliderBreedte, float sliderHoogte, int positie, int nPosities) {
  rectMode(CORNER);
  float blokjeBreedte = sliderBreedte / nPosities;
  noStroke();
  fill(255);
  rect(sliderX, sliderY, sliderBreedte, sliderHoogte);
  fill(KLEUR1);
  rect(sliderX + positie * blokjeBreedte, sliderY, blokjeBreedte, sliderHoogte);
  stroke(0);
}

int bepaalPositie(float sliderX, float sliderBreedte, int nPosities) {
  float blokjeBreedte = sliderBreedte / nPosities;
  if (mouseX < sliderX) {
    return 0;
  } else if (mouseX >= sliderBreedte + sliderX) {
    return nPosities - 1;
  } else {
    return floor((mouseX - sliderX) / blokjeBreedte);
  }
}

void Slider1() {
  sliderX = width/4;
  sliderY = height/2.5;
  sliderBreedte = width - 2*sliderX;
  sliderHoogte = height/8;
  nPosities = 5;
  coinPositie = positie;

  tekenSlider(sliderX, sliderY, sliderBreedte, sliderHoogte, positie, nPosities);
  if (mousePressed && mouseX >= sliderX && mouseX <= sliderX + sliderBreedte && mouseY <= sliderY + sliderHoogte && mouseY >= sliderY) {
    positie = bepaalPositie(sliderX, sliderBreedte, nPosities);
  } 
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);
  text("Coin amount: " + (positie + minimumCoins), width / 2, sliderY + sliderHoogte / 2);
  maxCoins = coinPositie + minimumCoins;
}

void Slider2() {
  sliderX = width/4;
  sliderY = height/5;
  sliderBreedte = width - 2*sliderX;
  sliderHoogte = height/8;
  nPosities = 3;
  maxMines = positie2 + minimumMines; 

  tekenSlider(sliderX, sliderY, sliderBreedte, sliderHoogte, positie2, nPosities);
  if (mousePressed && mouseX >= sliderX && mouseX <= sliderX + sliderBreedte && mouseY <= sliderY + sliderHoogte && mouseY >= sliderY) {
    tekenSlider(sliderX, sliderY, sliderBreedte, sliderHoogte, positie2, nPosities);
    positie2 = bepaalPositie(sliderX, sliderBreedte, nPosities);
  } 
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);
  text("Mine amount: " + maxMines, width / 2, sliderY + sliderHoogte / 2);
}


void Slider3() {
  sliderX = width/4;
  sliderY = height/1.7;
  sliderBreedte = width - 2*sliderX;
  sliderHoogte = height/8;
  nPosities = 2;
  maxPlayers = positie3 + 1;

  tekenSlider(sliderX, sliderY, sliderBreedte, sliderHoogte, positie3, nPosities);
  if (mousePressed && mouseX >= sliderX && mouseX <= sliderX + sliderBreedte && mouseY <= sliderY + sliderHoogte && mouseY >= sliderY) {
    tekenSlider(sliderX, sliderY, sliderBreedte, sliderHoogte, positie3, nPosities);
    positie3 = bepaalPositie(sliderX, sliderBreedte, nPosities);
  } 
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);
  text("Player amount: " + maxPlayers, width / 2, sliderY + sliderHoogte / 2);

  if (maxPlayers == 2) {
    tweedeSpeler = true;
  }
}

void settingUpdate() {
  int maxCoins = positie + minimumCoins;
  spawnCoins = new int [maxCoins][2];
  int maxMines = positie2 + minimumMines;
  spawnMines = new int [maxMines][2];
}
