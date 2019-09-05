import com.google.gson.JsonObject;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;

public class Max {
    public static JsonObject main(JsonObject args) throws Exception{
        String name = "stranger";
        if (args.has("name"))
            name = args.getAsJsonPrimitive("name").getAsString();

        int max = maxInBinaryFile(name);

        JsonObject response = new JsonObject();
        response.addProperty("max", "" + max );
        return response;
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

