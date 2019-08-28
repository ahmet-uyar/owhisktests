import java.io.PrintWriter;
import java.util.Random;

public class GenRandomData {
    final static double PER_LINE = 10;
    final static int RANDON_NUMBER_DIGITS = 6;
    private static Random rnd = new Random();

    public static void main(String args[]) throws Exception {

	// default file size, 1MB
	int fileSizeByte = 1024 * 1024;
	if (args.length != 0) {
		fileSizeByte = Integer.parseInt(args[0]) * 1024 * 1024;
	}
	System.out.println("fileSize: " + fileSizeByte / (1024 * 1024) + "MB");

        PrintWriter pw = new PrintWriter("data.txt");
	long size = 0;
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

	// ref: https://stackoverflow.com/questions/3709521/how-do-i-generate-a-random-n-digit-integer-in-java-using-the-biginteger-class
	public static String getRandomNumber(int digCount) {
	    StringBuilder sb = new StringBuilder(digCount);
	    for(int i=0; i < digCount; i++)
        	sb.append((char)('0' + rnd.nextInt(10)));
	    return sb.toString();
	}
}

