Tile t;
void setup(){
  size(800,600);
  t = new Tile(width/2,height/2,50,color(120,120,120));
  
}

void draw(){
  t.render();
}
