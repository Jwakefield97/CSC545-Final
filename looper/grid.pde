class Grid {
  
  Tile[][] tiles;
  
  public Grid(){
  
  }
  
  public void render(){
   
  }
  
  //return a tile if it is clicked else return null
  public Tile checkClickedTile() {
    Tile t = null;
    for(int y = 0; y < tiles[y].length; y++){
      for(int x = 0; x < tiles[x].length; x++){
        if(tiles[y][x].isClicked()) {
          t = tiles[y][x];
        }
      }
    }
    return t;
  }

}
