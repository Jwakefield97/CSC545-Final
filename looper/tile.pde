class Tile {
  private final int x, y, size;
  private color tileColor;
  private PImage tileImg;
  
  public Tile() {
    this.x = 0;
    this.y = 0; 
    this.size = 0;
    this.tileColor = color(0,0,0);
  }
  
  public Tile(int x, int y, int size, color c) {
    this.x = x;
    this.y = y; 
    this.size = size;
    this.tileColor = c;
  }
   
  public void render() {
    rectMode(CORNERS);
    fill(tileColor);
    rect(x,y,size,size);
    if(tileImg == null) {
      
    }
  }
  
  public boolean isClicked() {
    if (mouseX >= x && mouseX <= x+size && 
      mouseY >= y && mouseY <= y+size) {
      return true;
    } else {
      return false;
    }
  }
  
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
  
}
