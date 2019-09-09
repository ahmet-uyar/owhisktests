/**
 * generate multiple binary files with all the same sizes
 */

public class GenMultiBinaryFile {
  public static void main(String[] args) throws Exception{
    if (args.length != 2) {
      System.out.println("You need to provide number of files to be generated and each file size in MB.");
      System.out.println("Example: 10 files each with 1MB in size: java GenMultiBinaryFile 10 1");
      return;
    }

    int numberOfFiles = Integer.parseInt(args[0]);
    int fileSizeMB = Integer.parseInt(args[1]);
    long fileSizeByte = fileSizeMB * 1024 * 1024;

    long start = System.currentTimeMillis();

    for (int i = 0; i < numberOfFiles; i++) {
      String filename = "numbers-" + fileSizeMB + "-" + i + ".dat";
      GenBinaryFile.genBinaryFile(fileSizeByte, filename);
    }

    long delay = System.currentTimeMillis() - start;
    System.out.println("Delay: " + delay + " ms");
  }
}
