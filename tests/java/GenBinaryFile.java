import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;

/**
 * Generate a binary file with given size in MB
 * We measure data writing time to the disk
 * So, all other metrics are minimized.
 * We don't write random data. We write longs in increasing order.
 * We use buffered writer to optimize write speed.
 *
 * @author Ahmet Uyar
 */

public class GenBinaryFile {

  public static void main(String args[]) throws Exception {

    // default file size, 1MB
    int fileSizeMB = 1;
    if (args.length != 0) {
      fileSizeMB = Integer.parseInt(args[0]);
    }

    long fileSizeByte = fileSizeMB * 1024 * 1024;
    System.out.println("fileSize: " + fileSizeMB + "MB. " + fileSizeByte + "byte");

    String filename = "numbers-" + fileSizeMB + ".dat";
    long start = System.currentTimeMillis();
    genBinaryFile(fileSizeByte, filename);
    long delay = System.currentTimeMillis() - start;
    System.out.println("Writing time: " + delay);
  }

  // Ref: http://www.java2s.com/Code/Java/File-Input-Output/newDataOutputStreamnewBufferedOutputStreamnewFileOutputStream.htm
  // Write integers using buffered output, so that each write does not generate a disk activity
  // We want to minimize non-writing related activity
  // so, we just write loop control variable to the file
  public static void genBinaryFile(long fileSizeByte, String filename) throws Exception {

    // Open a binary file for output.
    DataOutputStream outputStream =
        new DataOutputStream(new BufferedOutputStream( new FileOutputStream(filename)));

    System.out.println("Writing longs to the file: " + filename);

    long iterations = fileSizeByte / 8;

    // Write longs to the file.
    for (long i = 0; i < iterations; i++) {
      outputStream.writeLong(i);
    }

    // Close the file.
    outputStream.close();
  }
}

