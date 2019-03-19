import processing.sound.*;
SoundFile file;
SinOsc sin;
//import ddf.minim.*;
//Minim minim;
//AudioPlayer guitar1;
//AudioPlayer bass1;
Tile t;
private Grid grid;
int sizeX = 8;
int sizeY = 1;
int savedTime;
int totalTime = 1000;
int lineX = -30;
boolean pause = true;

void setup(){
  grid = new Grid(sizeX, sizeY);
  size(800,600);
  savedTime = millis();
  
  // Sets up the tone
  sin = new SinOsc(this);
}

void draw(){
 clear();
 drawLine();
 
 if(!pause){ // Plays if unpaused
   int passedTime = millis() - savedTime;
   //This cuts off the tone before it plays again to prevent continous tones
   if(passedTime > totalTime * .90)
      sin.stop();
   //This plays the tone if it's time to play it
   if (passedTime > totalTime) {
       sin.stop();
      
      if(lineX < sizeX*30 - 30)
        lineX += 30;
      else
        lineX = 0;
      grid.playTileNote(lineX/30);
      
      savedTime = millis(); // Save the current time to restart the timer!
    }
 }
 else
   sin.stop();
 //Renders the grid
 grid.render(); 
}

void drawLine(){
  stroke(255,255,0);
  strokeWeight(10);
  line(22 + lineX, 5, 22 + lineX, 595);
  stroke(0);
  strokeWeight(1);
}

//check the tiles to see which one was clicked
void mouseReleased() {
  Tile clicked = grid.checkClickedTile();
  if(clicked != null){
    clicked.setActive(!clicked.isActive());  
  }
}
/* Keyboard presses
   'r': Resets line position
   Space: Pause
   UP: Less rows
   DOWN: More Rows
   LEFT: Less Columns
   RIGHT: More Columns
   + : Faster BPM
   - : Slower BPM
*/
void keyPressed(){
  if(key == CODED){
  	if(keyCode == DOWN){
  		if(sizeY < 11){
        sizeY++;
        grid = new Grid(sizeX, sizeY);
      }
  	}
    if(keyCode == UP){
      if(sizeY > 1){
        sizeY--;
        grid = new Grid(sizeX, sizeY);
      }
    }
    if(keyCode == LEFT){
      if(sizeX > 4){
        sizeX -=4;
        grid = new Grid(sizeX, sizeY);
      }
    }
    if(keyCode == RIGHT){
      if(sizeX < 20){
        sizeX+=4;
        grid = new Grid(sizeX, sizeY);
      }
    }
  }
  else if(key == 'r'){
    pause = true;
    lineX = -30;
  }
  else if(key == ' '){
    pause = !pause;
  }
  else if(key == '+'){
    if(totalTime > 100){
        totalTime -= 100;
      }
  }
  else if(key == '-'){
    if(totalTime < 5000){
        totalTime += 100;
      }
  }
}
