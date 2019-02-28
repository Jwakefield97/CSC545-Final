Tile t;
private Grid grid;
int sizeX = 10;
int sizeY = 10;
void setup(){
  grid = new Grid(sizeX, sizeY);
  size(800,600);
}

void draw(){
 grid.render();
  
}

//check the tiles to see which one was clicked
void mouseReleased() {
  if(grid.checkClickedTile() != null){
    background(random(0,255),random(0,255),random(0,255));  
   
  }
}
