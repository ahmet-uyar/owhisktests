import java.io.PrintWriter;
import java.util.Random;

/**
 * Generate a text file with given size.
 * We generate random integers with 6 digits.
 * We put 10 integers on each line.
 * Each integer is separated with comma and space.
 *
 * The process is not optimized for speed.
 *
 * @author Ahmet Uyar
 */

public class GenRandomTextData {
  final static double PER_LINE = 10;
  final static int RANDON_NUMBER_DIGITS = 6;
  private static Random rnd = new Random();

  public static void main(String args[]) throws Exception {

    // default file size, 1MB
    int fileSizeMB = 1;
    if (args.length != 0) {
      fileSizeMB = Integer.parseInt(args[0]);
    }

    String filename = "data-" + fileSizeMB+ ".txt";
    int fileSizeByte = fileSizeMB * 1024 * 1024;
    System.out.println("fileSize: " + fileSizeMB + "MB. " + fileSizeByte + "byte");

  	genTextFile(fileSizeByte, filename);

    System.out.println("Generated file: " + filename);
  }

  public static void genTextFile(int fileSizeByte, String filename) throws Exception {

    PrintWriter pw = new PrintWriter(filename);
    int iterations = fileSizeByte / 8;

    for (int i = 1; i <= iterations; i++) {
      String nStr = getRandomNumber(RANDON_NUMBER_DIGITS);
      if ((i % PER_LINE) == 0) {
        nStr += ",\n";
      } else {
        nStr += ", ";
      }
      pw.print(nStr);
    }

    pw.close();
  }

  /**
   * Generate a random number with constant digit size
   *
   * ref: https://stackoverflow.com/questions/3709521/how-do-i-generate-a-random-n-digit-integer-in-java-using-the-biginteger-class
   * @param digCount
   * @return
   */
  //
  public static String getRandomNumber(int digCount) {
    StringBuilder sb = new StringBuilder(digCount);
    for(int i=0; i < digCount; i++)
      sb.append((char)('0' + rnd.nextInt(10)));
    return sb.toString();
  }
}

