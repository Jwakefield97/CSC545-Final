import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;


class FileUtil {
  
  public FileUtil(){}
  
  void saveGrid(Grid g, String fileName) {
    FileOutputStream f;
    ObjectOutputStream o;
    try {
      f = new FileOutputStream(new File(fileName));
      o = new ObjectOutputStream(f);

      // Write objects to file
      o.writeObject(g);

      o.close();
      f.close();
    } catch(Exception e) {
      e.printStackTrace();
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
