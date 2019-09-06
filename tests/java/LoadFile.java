import java.io.File;
import java.io.FileInputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/**
 * We measure file reading time from disk
 * We do not interpret the loaded data
 * We just load to a buffer
 */
public class LoadFile {

  public static int READ_BUFFER_SIZE = 4 * 1024 * 1024; // 4MB

  public static void main(String[] args) throws Exception {
    if (args.length == 0) {
      System.out.println("You must provide filename from command line.");
      return;
    }

    String filename = args[0];
    long start = System.currentTimeMillis();
    readFile(filename);
    long delay = System.currentTimeMillis() - start;
    System.out.println("File reading delay: " + delay + " ms");
  }

  public static void readFile(String filename) throws Exception {

    File inputFile = new File(filename);
    FileInputStream fileInputStream = new FileInputStream(inputFile);
    FileChannel fileChannel = fileInputStream.getChannel();

    long fileSize = inputFile.length();
    ByteBuffer byteBuffer = ByteBuffer.allocate( READ_BUFFER_SIZE);

    long iterations = divRoundUp(fileSize, READ_BUFFER_SIZE);
    for (long i = 0; i < iterations; i++) {
      long readBytes = fileChannel.read(byteBuffer);
      byteBuffer.clear();
      if (readBytes != READ_BUFFER_SIZE) {
        System.out.println(i + " readBytes: " + readBytes + ", READ_BUFFER_SIZE: " + READ_BUFFER_SIZE);
      }
    }

    // Close the file.
    fileInputStream.close();

    System.out.println("Number of bytes in the file: " + fileSize);
  }

  // ref: https://stackoverflow.com/questions/7446710/how-to-round-up-integer-division-and-have-int-result-in-java
  public static long divRoundUp(long num, long divisor) {
    return num / divisor + (num % divisor == 0 ? 0 : 1);
  }

}

