import java.io.Serializable;

class Grid implements Serializable {
  static final long serialVersionUID = 1L;
  private int sizeX, sizeY;
  private Tile[][] tiles;
  private String drums[] = {"Drums\\ClHat.mp3","Drums\\Kick.mp3","Drums\\OpHat.mp3","Drums\\Snr.mp3","Drums\\Tom1.mp3","Drums\\Tom2.mp3","Drums\\Tom3.mp3","Drums\\ClHat.mp3","Drums\\Kick.mp3","Drums\\OpHat.mp3","Drums\\Snr.mp3"};
  private HashMap<String, ddf.minim.AudioSample> cachedFiles;
  
  private color colorPicker(int y){
    color c = color(255,0,0);
    switch(y){
     case 0:
       c = color(255,66,66);
       break;
     case 1:
       c = color(255,132,66);
       break;
     case 2:
       c = color(255,255,66);
       break;
     case 3:
       c = color(132,255,66);
       break;
     case 4:
       c = color(66,255,66);
       break;
     case 5:
       c = color(66,255,132);
       break;
     case 6:
       c = color(66,255,255);
       break;
     case 7:
       c = color(66,132,255);
       break;
     case 8:
       c = color(66,66,255);
       break;
     case 9:
       c = color(66,66,132);
       break;
     case 10:
       c = color(66,66,66);
       break;
    }
    return c;
  }
  
  public Grid(Tile[][] tiles, int sizeX, int sizeY){
    this.tiles = tiles;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    cachedFiles = new HashMap<String, ddf.minim.AudioSample>();
  }
  
  public Grid(int sizeX, int sizeY){
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    tiles = new Tile[sizeY][sizeX];
    for(int y =0; y < tiles.length; y++){
      color c = colorPicker(y);
      for(int x =0; x < tiles[y].length; x++){  
        tiles[y][x] = new Tile((width * 1/3) - 10 + x*30,(height * 1/3) - 10 + y*30,25,c,drums[y],false);
      }
    }
    cachedFiles = new HashMap<String, ddf.minim.AudioSample>();
  }
  
  public void render(){
   for(int y =0; y < tiles.length; y++){
      for(int x =0; x < tiles[y].length; x++){
        tiles[y][x].render();
      }
    }
  }
  
  //return a tile if it is clicked else return null
  public Tile checkClickedTile() {
    Tile t = null;
    for(int y = 0; y < tiles.length; y++){
      for(int x = 0; x < tiles[y].length; x++){
        if(tiles[y][x].isClicked() && mouseButton == LEFT) {
          t = tiles[y][x];
        } else if (tiles[y][x].isClicked() && mouseButton == RIGHT) {
          selectInput("Select a file for the tile:", "fileSelected");
        }  
      }
    }
    return t;
  }
  
  // Plays the notes
  public void playTileNote(int x){
    for(int y = 0; y < tiles.length; y++){
      if(tiles[y][x].isActive()) {
        ddf.minim.AudioSample file = cachedFiles.get(tiles[y][x].getFileName());
        if(file == null) {
          file = minim.loadSample(tiles[y][x].getFileName());
          cachedFiles.put(tiles[y][x].getFileName(), file);
        }
        file.trigger();
      }
    }
  }
  
  //set the filename for an entire row
  public void setRowFileName(Tile hoverTile, String filename) {
    for(int y = 0; y < tiles.length; y++){
      for(int x = 0; x < tiles[y].length; x++){
        Tile t = tiles[y][x];
        if(t.getY() == hoverTile.getY()) {
          t.setFileName(filename);
        }
      }
    }
  }
  
  //resize the grid and include the old tile info
  public void gridResize(int newX, int newY) {
    Grid newGrid = new Grid(newX, newY);
    Tile[][] oldTiles = this.getTiles();
    this.tiles = newGrid.getTiles();
    this.sizeX = newX;
    this.sizeY = newY;
    for(int y = 0; y < oldTiles.length; y++){
      for(int x = 0; x < oldTiles[y].length; x++){
        try {
          tiles[y][x] = oldTiles[y][x];
          this.setRowFileName(tiles[y][x], tiles[y][x].getFileName());
        } catch (Exception e) {}
        
      }
    }
  }
  
  public Tile[][] getTiles(){
    return tiles;
  }
  
  public int getSizeX(){
    return sizeX;
  }
  
  public int getSizeY(){
    return sizeY;
  }
  

}
