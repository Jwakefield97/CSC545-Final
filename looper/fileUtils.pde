class FileUtil {
  
  public FileUtil(){}
  
  //method to serialize the grid as json
  void saveGrid(Grid g, String fileName) {
    JSONObject outputObject = new JSONObject();
    
    JSONArray outputTiles = new JSONArray();
    Tile[][] tiles = g.getTiles();
    
    for(int y = 0; y < tiles.length; y++){
      JSONArray colArray = new JSONArray();
      for(int x = 0; x < tiles[y].length; x++){
        Tile t = tiles[y][x];
        JSONObject json = new JSONObject();
        json.setInt("size",t.getSize());
        json.setInt("x",t.getX());
        json.setInt("y",t.getY());
        json.setInt("tileColor",t.getTileColor());
        json.setString("fileName",t.getFileName());
        json.setBoolean("active",t.isActive());
        colArray.setJSONObject(x,json);
      }
      outputTiles.setJSONArray(y,colArray);
    }
    outputObject.setJSONArray("tiles",outputTiles);
    outputObject.setInt("sizeX",g.getSizeX());
    outputObject.setInt("sizeY",g.getSizeY());
    saveJSONObject(outputObject,fileName);
  }
  
  //method to deserialize the saved json object to a grid object
  Grid getGrid(String fileName) {
    JSONObject inputObject = loadJSONObject(fileName);
    int sizeX = inputObject.getInt("sizeX"), sizeY = inputObject.getInt("sizeY");
    Tile[][] tiles = new Tile[sizeY][sizeX];
    
    JSONArray input = inputObject.getJSONArray("tiles");
    for(int y = 0; y < input.size(); y++){
      JSONArray colArray = input.getJSONArray(y);
      for(int x = 0; x < colArray.size(); x++){
        JSONObject json = colArray.getJSONObject(x);
        int size = json.getInt("size");
        int tileX = json.getInt("x");
        int tileY = json.getInt("y");
        int tileColor = json.getInt("tileColor");
        String tileFileName = json.getString("fileName");
        boolean active = json.getBoolean("active");
        
        tiles[y][x] = new Tile(tileX,tileY,size,tileColor,tileFileName,active);
      }
    }  
    return new Grid(tiles,sizeX,sizeY);
  }
}
