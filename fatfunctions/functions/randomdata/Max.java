import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;

public class Max {
  public static void main(String[] args) throws Exception {
    if (args.length == 0) {
      System.out.println("You must provide filename from command line.");
      return;
    }

    String filename = args[0];
    int count = maxInBinaryFile(filename);
    System.out.println("Max integer in the file: " + count);
  }

  public static int maxInBinaryFile(String filename) throws Exception {

    // Open a binary file for output.
    File inputFile = new File(filename);
    FileInputStream fstream = new FileInputStream(filename);
    DataInputStream inputStream = new DataInputStream(fstream);

    int max = Integer.MIN_VALUE;
    long numberOfIntegers = inputFile.length() / 4;
    for (long i = 0; i < numberOfIntegers; i++) {
      int next = inputStream.readInt();
      if (next > max) {
        max = next;
      }
    }

    // Close the file.
    inputStream.close();

    System.out.println("Number of Integers in the file: " + numberOfIntegers);

    return max;
  }
}
