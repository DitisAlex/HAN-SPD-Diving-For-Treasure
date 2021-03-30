PImage tb; // background main menu
PImage tb2; // background setting scherm & uitleg scherm
PImage tb3; // background spel scherm
PImage boat;
PImage coin; 
PImage mine;
PImage oxygen;

void imageSettings() {
  tb = loadImage("treasure_background2.jpg");
  tb.resize(width, height);

  tb2 = loadImage("treasure_background3.jpg");
  tb2.resize(width, height);

  tb3 = loadImage("treasure_background.jpg");
  tb3.resize(width, height);

  boat = loadImage("boat.png");
  boat.resize(width/2, height/5);

  coin = loadImage("coin.png");
  coin.resize((width+height)/22, (width+height)/22);

  mine = loadImage("mine.png");
  mine.resize((width+height)/22, (width+height)/22);

  oxygen = loadImage("oxygen.png");
  oxygen.resize((width+height)/22, (width+height)/22);
}
