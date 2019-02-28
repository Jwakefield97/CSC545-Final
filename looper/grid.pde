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
        rect(tiles[i][j].getX(), tiles[i][j].getY(), tiles[i][j].getSize(), tiles[i][j].getSize());
      }
    }
  }

}
