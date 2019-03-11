class Grid {
  private Tile[][] tiles;
  
  public Grid(int sizeX, int sizeY){
    tiles = new Tile[sizeY][sizeX];
    for(int i =0; i < tiles.length; i++){
      color c = color(255 - i *50,0 + i *50, 0 + i * 50);
      for(int j =0; j < tiles[i].length; j++){
        tiles[i][j] = new Tile(10 + j*30,10 + i*30,25,c);
      }
    }
  }
  
  public void render(){
   for(int i =0; i < tiles.length; i++){
      for(int j =0; j < tiles[i].length; j++){
        tiles[i][j].render();
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
    for(int y = 0; y < tiles.length; y++){
      if(tiles[y][x].isActive()) {
        //Plays tone at the Hz of 440 - the row
        sin.play(440 - (y*26),1);
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

}
