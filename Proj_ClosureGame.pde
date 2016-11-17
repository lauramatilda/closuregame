/*
 CLOSURE /////////////////////////////////////////////////////////////////////////
 (a.k.a. SKI FREE OR DIE) ////////////////////////////////////////////////////////
 by Laura Matilda Koivunen ///////////////////////////////////////////////////////
 A "game" inspired by hours of childhood SkiFree frustration./////////////////////
 The graphic elements were lovingly hand-crafted using a public domain ///////////
 hexagon map starter kit courtesy of opengameart.org./////////////////////////////
 */

Monster yeti; //meet the monster in our story, a yeti
Prey matti; //meet Matti, the monster wants to eat him
Timer timer;
PFont font;

boolean gameState=false;
boolean left=false, right=false, up=false, down=false;
PImage bg, matSprite, yetiSprite, loadScreen;

public final int obstArr[] = { //OBSTACLES WE CANNOT CROSS
  131, 327, 255, 40, //lower ridge
  193, 235, 133, 44, //upper ridge
  0, 488, 325, 112, //bottom lake
  707, 113, 93, 133, //right lake
  0, 0, 102, 180, //top right mountains
  101, 0, 190, 116, //top lake
  647, 270, 90, 90, //snowball
  0, -25, 800, 50, //top edge
  0, 580, 800, 50, //bottom edge
  -25, 0, 50, 600, //left edge
  775, 0, 50, 600 //right edge  
};  

void setup() { //SETUP THE GAME

  size(800, 600);
  imageMode(CENTER);
  
  font = loadFont("Open24DisplaySt-48.vlw");
  textFont(font);
  textAlign(RIGHT);
  
  timer = new Timer(30000); //timer that counts down
  timer.start();
  
  yeti = new Monster(); //"yeti" is a new instance of custom class type Monster
  matti = new Prey(); //"matti" is a new instance of custom class type Prey
  bg = loadImage("BG_img.jpg");//let's load the images we'll be using
  yetiSprite = loadImage("yeti_stand.png");
  loadScreen = loadImage("loadscreen.jpg");
}

void draw() {
  if (!gameState) { //display loading screen until mouse pressed
  
    image(loadScreen, width/2, height/2);
    
  } else { //if gameState is true, initialize all the game elements
  
    background(bg);
    timer.display();
    yeti.update();
    yeti.display();
    matti.update(yeti); //let Matti know all about the yeti's movements so he can avoid it
    matti.display();
    
    if (timer.Finished()) {
      image(loadScreen, width/2, height/2);//game over screen when timer ends
    }
  }
}
void mousePressed() {
  gameState=true;
  loadScreen = loadImage("endscreen.jpg"); //load end screen once initial loading screen turned off
}