Tile t;
private Grid grid;
int sizeX = 10;
int sizeY = 10;
void setup(){
  grid = new Grid(sizeX, sizeY);
  size(800,600);
}

void draw(){
 clear();
 grid.render();
  
}

//check the tiles to see which one was clicked
void mouseReleased() {
  Tile clicked = grid.checkClickedTile();
  if(clicked != null){
    clicked.setActive(!clicked.isActive());  
  }
}
