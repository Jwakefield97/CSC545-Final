class Tile {
  private final int x, y, size;
  
  public Tile() {
    this.x = 0;
    this.y = 0; 
    this.size = 0;
  }
  
  public Tile(int x, int y, int size) {
    this.x = x;
    this.y = y; 
    this.size = size;
  }
   
  public void render() {
   
  }
  
  public boolean isClicked() {
    return false;
  }
  
  public int getX() {
    return this.x;
  }
  public int getY() {
    return this.y;
  }
  public int getSize() {
    return this.size;
  }
  
}
