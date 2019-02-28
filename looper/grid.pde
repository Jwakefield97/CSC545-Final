class Grid {
  private Tile[][] tiles;
  
  public Grid(int sizeX, int sizeY){
    tiles = new Tile[sizeX][sizeY];
    for(int i =0; i < tiles.length; i++){
      color c = color(255 - i *50,0 + i *50, 0 + i * 50);
      for(int j =0; j < tiles[i].length; j++){
        tiles[i][j] = new Tile(10 + i*30,10 + j*30,25,c);
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

}
