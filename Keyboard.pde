
void keyPressed() { //check which key is pressed(using ASCII keycode) and change direction boolean value
  switch(keyCode) {
  case 37: //LEFT
    left=true;
    break;
  case 38:// UP
    up=true;
    break;
  case 40: //DOWN
    down=true;
    break;
  case 39: //RIGHT
    right=true;
    break;
  }
}

void keyReleased() { //turn off direction when key released
  switch(keyCode) {
  case 37:
    left=false;
    break;
  case 38:
    up=false;
    break;
  case 40:
    down=false;
    break;
  case 39:
    right=false;
    break;
  }
}