class Monster {
  float x, y, w, h;
  float speedX, speedY;
  float lastX, lastY;
  public PImage[] images;
  public int imageCount=9;
  public int frame=0;
  String filename = "";

  //LOAD YETI INITIAL VALUES
  Monster() { 
    x=width/2;
    y=height/2;
    w=60;
    h=60;
    speedX=0;
    speedY=0;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      filename = "yeti_0" + i + ".png";
      images[i] = loadImage(filename);
    }
  }
  //MOVE YETI BY KEY CONTROLS
  void update() { 
    if (left) { 
      speedX=-2;
    }
    if (right) {
      speedX=2;
    }
    if (!left && !right) {
      speedX=0;
    }
    if (up) {
      speedY=-2;
    }
    if (down) {
      speedY=2;
    }
    if (!down && !up) {
      speedY=0;
    }

    //CREATE BOUNDS/OBSTACLES TO MOVEMENT
    for (int i=0; i<obstArr.length; i=i+4) { 
      /* if needed for debugging purposes, draw the obstacles 
       fill(255, 0, 0, 80);
       noStroke();
       rect(obstArr[i], obstArr[i+1], obstArr[i+2], obstArr[i+3]); */
      if (x>obstArr[i] && y>obstArr[i+1] && x<(obstArr[i]+obstArr[i+2]) && y<(obstArr[i+1]+obstArr[i+3])) {
        x=lastX; //if yeti is over one of the obstacles, move it back to the last known OK x,y location
        y=lastY;
      }
    } 
    lastX=x; //declare OK x,y values if not in conflict with obstacles
    lastY=y;
    x += speedX; //move forward
    y += speedY;
  }

  //DISPLAY THE YETI
  void display() {
    if (keyPressed) { //cycle through the frames of the yeti to animate it
      frame = (frame+1) % imageCount; 
      image(images[frame], x, y);
    } else if (!keyPressed) { //if no key pressed, yeti stands still
      image(yetiSprite, x, y);
    }
  }
}