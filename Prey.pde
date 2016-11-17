class Prey {
  float x, y, w, h;
  float speedX, speedY;

  public PImage[] images;
  public int imageCount=5;
  public int frame=0;
  String filename = "";

  Prey() { //LOAD PREY INITIAL VALUES
    x=600;
    y=100;
    /*can also use 
     x=random(300, width-100);
     y=random(300, height-100);*/
    speedX=random(2);
    speedY=random(2);
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      filename = "matti_0" + i + ".png";
      images[i] = loadImage(filename);
    }
  }
  void update(Monster yeti) { //update prey's location based on info from monster sprite
    float flightDist = dist(x, y, yeti.x, yeti.y);//figure out how close to monster

    if (flightDist<170) { //if monster is closer, run away
      if (abs(x-yeti.x)>abs(y-yeti.y)) {
        if (x<yeti.x) {
          speedX=-3;
          speedY=-2;
        } else {
          speedX=3;
          speedY=2;
        }
      } else {
        if (y<yeti.y) {
          speedY=-2;
          speedX=1;
        } else {
          speedY=2;
          speedX=1;
        }
      }
    } else if (flightDist>250) {//if monster far away, creep closer
      if (abs(x-yeti.x)>abs(y-yeti.y)) {
        if (x<yeti.x) {
          speedX=1;
        } else {
          speedX=-1;
        }
      } else {
        if (y<yeti.y) {
          speedY=1;
        } else {
          speedY=-1;
        }
      }
    } else { //randomized speed for some more life-like movement
      speedX=random(-2, 2);
      speedY=random(-2, 3);
    }
    
    //keep the prey from running into obstacles, off edges OK
    for (int i=0; i<(obstArr.length-20); i=i+4) { 
      if (x+(speedX*2)>obstArr[i] && x+(speedX*2)<(obstArr[i]+obstArr[i+2])) {
        speedX=-speedX;
      }
      if (y+(speedY*2)>obstArr[i+1] && y+(speedY*2)<(obstArr[i+1]+obstArr[i+3])) {
      }
    }

    //IF NO IMPEDIMENTS, MOVE PREY
    x += speedX;
    y += speedY;
    
  }

  void display() { //DRAW PREY
    frame = (frame+1) % imageCount; 
    image(images[frame], x, y);
  }
}