import java.io.Serializable;

class Grid implements Serializable {
  static final long serialVersionUID = 1L;
  private int sizeX, sizeY;
  private Tile[][] tiles;
  private String drums[] = {"Drums\\ClHat.wav","Drums\\Kick01.wav","Drums\\OpHat01.wav","Drums\\Snr01.wav","Drums\\Tom01.wav","Drums\\Tom02.wav","Drums\\Tom03.wav"};
  
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
  }
  
  public Grid(int sizeX, int sizeY){
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    tiles = new Tile[sizeY][sizeX];
    for(int y =0; y < tiles.length; y++){
      color c = colorPicker(y);
      for(int x =0; x < tiles[y].length; x++){  
        //if(y>7)
        //  tiles[y][x] = new Tile((width * 1/3) - 10 + x*30,(height * 1/3) - 10 + y*30,25,c,drums[y]);
        //else
        //  tiles[y][x] = new Tile((width * 1/3) - 10 + x*30,(height * 1/3) - 10 + y*30,25,c,drums[0]);
        
        tiles[y][x] = new Tile((width * 1/3) - 10 + x*30,(height * 1/3) - 10 + y*30,25,c,y < 3 ? "Guitar1.mp3" : "Bass1.mp3",false);
      }
    }
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
        if(tiles[y][x].isClicked()) {
          t = tiles[y][x];
        }
      }
    }
    return t;
  }
  
  // Plays the notes
  public void playTileNote(int x){
    AudioPlayer[] mplayer = new AudioPlayer[tiles.length];
    
    for(int y = 0; y < tiles.length; y++){
      if(tiles[y][x].isActive()) {
         mplayer[y] = minim.loadFile(tiles[y][x].getFileName());
         mplayer[y].play();
        //Plays tone at the Hz of 440 - the row
        //sin.amp(1);
        //sin.play(440 - (y*26),1);
        //if(y == 0){
        //  //guitar1.rewind();
        //  //guitar1.play();
        //   sin.play(445,1);
        //}
        //else{
        //  //bass1.rewind();
        //  //bass1.play();
        //}
        //file.play(tiles.length - y, 1.0);
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
