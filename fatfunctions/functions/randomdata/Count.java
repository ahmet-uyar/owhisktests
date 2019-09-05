import java.io.DataInputStream;
import java.io.FileInputStream;

public class Count {
  public static void main(String[] args) throws Exception {
    if (args.length == 0) {
      System.out.println("You must provide filename from command line.");
      return;
    }

    String filename = args[0];
    int count = countInBinaryFile(filename);
    System.out.println("Number of Integers in the file: " + count);
  }

  public static int countInBinaryFile(String filename) throws Exception {

    // Open a binary file for output.
    FileInputStream fstream = new FileInputStream(filename);
    DataInputStream inputStream = new DataInputStream(fstream);

    System.out.println("Reading from the file: " + filename);

    int count = 0;

    int max = Integer.MIN_VALUE;

    while (inputStream.available() > 0) {
      int next = inputStream.readInt();
      if (next > max) {
        max = next;
      }
      count++;
    }

    // Close the file.
    inputStream.close();

    System.out.println("max in file: " + max);

    return count;
  }
}

