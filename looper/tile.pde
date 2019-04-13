
class Tile implements Serializable {
  static final long serialVersionUID = 1L;
  private final int x, y, size;
  private color tileColor;
  private PImage tileImg;
  private boolean active = false;
  private String fileName = "Drums/.wav", fileNameShort = "";

  public Tile() {
    this.x = 0;
    this.y = 0; 
    this.size = 0;
    this.tileColor = color(0,0,0);
  }
  
  public Tile(int x, int y, int size, color c, String fileName, boolean active) {
    this.x = x;
    this.y = y; 
    this.size = size;
    this.tileColor = c;
    setFileName(fileName); //sets the short file name as well
    this.active = active;
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
    isHoverTile();
    noStroke();
  }
  
  public void drawInfo() {
    int textX = x+size/2, textY = y-size/2;
    textAlign(LEFT, LEFT);
    textSize(15);
    float textHeight = textAscent()+textDescent();
    strokeWeight(2);
    stroke(0,0,255);
    fill(255);
    rect(textX,textY,textWidth(fileNameShort)+25,textHeight+10);
    fill(0);
    text(fileNameShort,textX+10,y+10);
  }
  
  private void isHoverTile() {
    if (mouseX >= x && mouseX <= x+size && 
      mouseY >= y && mouseY <= y+size) {
      hoverTile = this;
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
    this.fileNameShort = fileName.substring(fileName.lastIndexOf("\\")+1);
  }
  public String getFileName(){
    return this.fileName;
  }
  public void setFileNameShort(String fileName){
    this.fileNameShort = fileName;
  }
  public String getFileNameShort(){
    return this.fileNameShort;
  }
  
}
