import java.util.ArrayList;
import java.util.Random;

/**
 * load multiple files in min-max order and random order
 * we compare loading time for hdd and ssd
 */

public class LoadMultiFile {
  private static Random rnd = new Random();

  public static void main(String[] args) throws Exception {
    if (args.length != 2) {
      System.out.println("You need to provide number of files to be loaded and base file name.");
      System.out.println("Example: 10 files with base name: java GenMultiBinaryFile 10 numbers-1-");
      return;
    }

    int numberOfFiles = Integer.parseInt(args[0]);
    String baseFileName = args[1];

    long start = System.currentTimeMillis();
//    loadMinMaxOrder(numberOfFiles, baseFileName);
    StringBuffer toPrint = loadRandomOrder(numberOfFiles, baseFileName);

    long delay = System.currentTimeMillis() - start;

    System.out.println("Files read: \n" + toPrint);
    System.out.println("Delay: " + delay + " ms");
  }

  public static StringBuffer loadRandomOrder(int numberOfFiles, String baseFileName) throws Exception {

    ArrayList<Integer> numbers = new ArrayList();
    ArrayList<Integer> fileNumbers = new ArrayList();

    for (int i = 0; i < numberOfFiles; i++) {
      numbers.add(i);
    }

    for (int i = 0; i < numberOfFiles; i++) {
      int index = rnd.nextInt(numbers.size());
      fileNumbers.add(numbers.remove(index));
    }

    StringBuffer toPrint = new StringBuffer();

    int index = 0;
    for (Integer number: fileNumbers) {
      String filename = baseFileName + number + ".dat";
      toPrint.append(index++ + ": " + filename + "\n");
      LoadFile.readFile(filename);
    }

    return toPrint;
  }

  public static void loadMinMaxOrder(int numberOfFiles, String baseFileName) throws Exception{

    for (int i = 0, j = numberOfFiles - 1; i < numberOfFiles / 2; i++, j--) {
      String filename = baseFileName + i + ".dat";
      System.out.println("reading file: " + filename);
      LoadFile.readFile(filename);

      filename = baseFileName + j + ".dat";
      System.out.println("reading file: " + filename);
      LoadFile.readFile(filename);
    }
  }
}

