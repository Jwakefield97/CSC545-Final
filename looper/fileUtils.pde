import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;


class FileUtil {
  
  private String saveDirectory = "./";
  
  public FileUtil(){}
  
  public FileUtil(String saveDir) {
    this.saveDirectory = saveDir;
  }
  
  void saveGrid(Grid g, String fileName) {
    try {
      FileOutputStream f = new FileOutputStream(new File(saveDirectory+fileName));
      ObjectOutputStream o = new ObjectOutputStream(f);

      // Write objects to file
      o.writeObject(g);

      o.close();
      f.close();
    } catch(Exception e) {
    }
      

  }
  
  Grid getGrid(String fileName) {
    Grid g = null;
    try {
      FileInputStream f = new FileInputStream(new File(fileName));
      ObjectInputStream o = new ObjectInputStream(f);
    
      // Read objects
      g = (Grid) o.readObject();
    
      o.close();
      f.close();
    } catch(Exception e) {}
    
    return g;
  }
}
