import processing.sound.*;
SoundFile file;
SinOsc sin;
import ddf.minim.*;
Minim minim;
//AudioPlayer guitar1;
//AudioPlayer bass1;
Tile t;
Tile hoverTile; //the tile that is being hovered over
private Grid grid;
int sizeX = 8;
int sizeY = 1;
int savedTime;
int totalTime = 1000;
int lineX = -30;
boolean pause = true, showTitle = true, showExit = false, loadFile = false;
PFont f;
String menuText[] = {"Load","Save","Clear","Exit"};
FileUtil fileUtil;
void settings() {
  size(800,600);
  //fullScreen();
}
void setup(){

  grid = new Grid(sizeX, sizeY);
  f = createFont("Verdana-12.vlw",10);
  
  savedTime = millis();
  
  // Sets up the tone
  sin = new SinOsc(this);
  minim = new Minim(this);
  fileUtil = new FileUtil();
}

void draw(){
 clear();
 if(showTitle)
   drawTitle();
 else if(showExit)
   drawExit();
 else{
   drawGrid();
   drawMenu();
 }

}

void drawGrid(){
  strokeWeight(1);
   if(lineX > -30)
     drawLine();     
   if(!pause){ // Plays if unpaused     
     int passedTime = millis() - savedTime;
     //This cuts off the tone before it plays again to prevent continous tones
     if(passedTime > totalTime * .80)
        sin.amp(0.0);
     //This plays the tone if it's time to play it
     if (passedTime > totalTime) {
         sin.amp(0.0);
        
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
   if(hoverTile != null) {
     hoverTile.drawInfo();
   }
}

void drawLine(){
  stroke(255,255,0);
  strokeWeight(10);
  
  line((width * 1/3) + 2 + lineX, (height * 1/3) - 13, (width * 1/3) + 2 + lineX, (height * 1/3) - 13 + sizeY*30);
  stroke(0);
  strokeWeight(1);
}

void drawMenu(){
  stroke(0,0,0);
  fill(150);
  rect(0,0,width,50);
  for(int i = 0; i < 3; i++){
    if(mouseX > (i*10) + (i*100) + 5 && mouseX < (i*10) + (i*100) + 105 && mouseY > 5 && mouseY < 45)
      fill(26,203,248);
    else
      fill(225);
    strokeWeight(2); 
    rect((i*10) + (i*100) + 5,5,100,40); 
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text(menuText[i], (i*10) + (i*100) + 55, 30);
  }
  
  
  if(mouseX > width - 105 && mouseX < width - 5 && mouseY > 5 && mouseY < 45)
    fill(248,50,75);
  else
    fill(225);
  rect(width - 105,5,100,40);
  fill(0);
  textAlign(CENTER);
  textSize(16);
  text(menuText[3], width - 55, 30);
  
}

void drawTitle(){
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Super Awesome Music Player", width/2, height/2);
  
  if(mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY >  height/2 + 50 && mouseY < height/2 + 100)
    fill(75,254,75);
  else
    fill(254,254,75);
  strokeWeight(2);
  rect(width/2 - 100,height/2 + 50,200,50);
  
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("--Start-Game-->", width/2, height/2 + 80);
}

void drawExit(){
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Exiting...", width/2, height/2);
  exit();
}

//check the tiles to see which one was clicked
void mouseReleased() {
  Tile clicked = grid.checkClickedTile();
  if(clicked != null){
    clicked.setActive(!clicked.isActive());  
  }
  if(mouseX > width - 105 && mouseX < width - 5 && mouseY > 5 && mouseY < 45 && showTitle == false){
    showExit = true;
  } else if(mouseX > 5 && mouseX < 105 && mouseY > 5 && mouseY < 45) { //load button
    loadFile = true;
    selectInput("Select a file to process:", "fileSelected");
  } else if (mouseX > 115 && mouseX < 215 && mouseY > 5 && mouseY < 45) { //save button
    loadFile = false;
    selectInput("Select a file to process:", "fileSelected");
  } else if (mouseX > 225 && mouseX < 325 && mouseY > 5 && mouseY < 45) { //clear button
    sizeX = 8;
    sizeY = 1;
    grid = new Grid(sizeX, sizeY);
  } else if(mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY >  height/2 + 50 && mouseY < height/2 + 100 && showTitle == true){
    showTitle = false;
  }
  
}
void mouseMoved(){
  if(mouseX > 5 && mouseX < 105 && mouseY > 5 && mouseY < 45){
    cursor(HAND);
  } else if(mouseX > 115 && mouseX < 215 && mouseY > 5 && mouseY < 45) {
    cursor(HAND);
  } else if(mouseX > 225 && mouseX < 325 && mouseY > 5 && mouseY < 45) {
    cursor(HAND);
  } else if(mouseX > width - 105 && mouseX < width - 5 && mouseY > 5 && mouseY < 45)
    cursor(HAND);
  else if(mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY >  height/2 + 50 && mouseY < height/2 + 100 && showTitle == true)
    cursor(HAND);
  else
    cursor(ARROW);
}
//a method that handles the selected file from file explorer
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    if(loadFile){ //user is loading a file from a path
      Grid newGrid = fileUtil.getGrid(selection.getAbsolutePath());
      if(newGrid != null) {
        grid = newGrid;
      }
    }else{ //user is saving a file to a location
      fileUtil.saveGrid(grid,selection.getAbsolutePath());
    }
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
  else if(key == ESC){
      key = ',';
      showTitle = false;
      showExit = true;
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
