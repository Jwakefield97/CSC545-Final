Tile t;
void setup(){
  size(800,600);
  PImage img = loadImage("electricguitar.jpeg");
  t = new Tile(width/2,height/2,50,color(120,120,120));
  t.setTileImage(img);
}

void draw(){
  t.render();
  
}

//check the tiles to see which one was clicked
void mouseReleased() {
  if(t.isClicked()){
    background(random(0,255),random(0,255),random(0,255));  
  }
}
