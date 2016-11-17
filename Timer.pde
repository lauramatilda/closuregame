class Timer {
 
  int startTime; // timer start
  int totalTime; // timer length
  int passedTime; //time passed
  
  Timer(int inputTime) {
    totalTime = inputTime;
  }
  
  // Start the timer
  void start() {
    startTime = millis(); 
  }
  void display(){
    fill(255);
    int currentTime = int(millis()/1000);
    text((30-currentTime), 790, 42);
    
    if (currentTime<3){ //display instructions
      fill(0);
      text("Use arrow keys to move around", 675, 550); 
    }
  }
  
//return true when timer runs out
  boolean Finished() { 
    passedTime = millis()- startTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
   }
   
 }