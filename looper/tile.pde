class Tile {
  private final int x, y, size;
  private color tileColor;
  private PImage tileImg;
  private boolean active = false;
  private String fileName = "Drums/ClHat.wav";

  
  public Tile() {
    this.x = 0;
    this.y = 0; 
    this.size = 0;
    this.tileColor = color(0,0,0);
  }
  
  public Tile(int x, int y, int size, color c, String fileName) {
    this.x = x;
    this.y = y; 
    this.size = size;
    this.tileColor = c;
    this.fileName = fileName;
    
  }
   
  public void render() {
    if(active){
      strokeWeight(3);
      stroke(255,0,0);
    }
    fill(tileColor);
    rect(x,y,size,size);
    if(tileImg != null) {
      image(tileImg,x+5,y+5,size-10,size-10);
    }
    noStroke();
  }
  
  public boolean isClicked() {
    if (mouseX >= x && mouseX <= x+size && 
      mouseY >= y && mouseY <= y+size) {
      return true;
    } else {
      return false;
    }
  }
  
  
  //getters/setters
  
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getSize() {
    return size;
  }
  public int getTileColor() {
    return tileColor;  
  }
  public void setTileColor(color c) {
    this.tileColor = c;
  }
  public void setTileImage(PImage img) {
    this.tileImg = img;
  }
  public void setActive(boolean active){
    this.active = active;
  }
  public boolean isActive(){
    return active;
  }
  public void setFileName(String fileName){
    this.fileName = fileName;
  }
  public String getFileName(){
    return this.fileName;
  }
  
}
