import java.io.*;
import java.util.Random;

/**
 * Generate a binary file with given size in MB
 * We generate random integers and write to the file
 *
 * @author Ahmet Uyar
 */

public class GenRandomBinaryData {
  private static Random rnd = new Random();

  public static void main(String args[]) throws Exception {

    // default file size, 1MB
    int fileSizeMB = 1;
    if (args.length != 0) {
      fileSizeMB = Integer.parseInt(args[0]);
    }

    int fileSizeByte = fileSizeMB * 1024 * 1024;
    System.out.println("fileSize: " + fileSizeMB + "MB. " + fileSizeByte + "byte");
    String filename = "numbers-" + fileSizeMB + ".dat";

    genBinaryFile(fileSizeByte, filename);
    System.out.println("Generated file: " + filename);
  }

  // ref: https://cs.wmich.edu/gupta/teaching/cs1120/1120Sp13web/codeJava/advanceFileIO.txt
  public static void genBinaryFile(int fileSizeByte, String filename) throws Exception {

    // Open a binary file for output.
    DataOutputStream outputStream =
        new DataOutputStream(new BufferedOutputStream( new FileOutputStream(filename)));

    System.out.println("Writing to the file...");

    int iterations = fileSizeByte / 4;

    // Write the array elements to the binary file.
    for (int i = 0; i < iterations; i++) {
      int n = rnd.nextInt();
      outputStream.writeInt(n);
    }

    // Close the file.
    outputStream.close();
  }
}

