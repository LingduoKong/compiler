import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Stack;
import java.util.StringTokenizer;
public class main {

    public static void main(String[] args) {
        removeComments("foo.c", "output.txt");
    }

    public static void replaceMacroCode(String readingFilePath, String newFilePath) {

    }

    public static void removeComments(String readingFilePath, String newFilePath) {
        Path path = Paths.get(readingFilePath);
        File file = new File(newFilePath);
        try {
            InputStream in = Files.newInputStream(path);
            BufferedReader reader = new BufferedReader((new InputStreamReader(in)));
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fileWriter = new FileWriter(file, true);
            String str;
            StringBuilder sb = new StringBuilder();
            while ((str = reader.readLine()) != null) {
                sb.append(str + "\n");
            }
            String res = replaceMethod2(sb.toString());
            fileWriter.append(res);
            fileWriter.close();
        } catch (IOException e) {
            System.out.println(e.getStackTrace());
        }
    }

    public static String replaceMethod1(String str) {
        String res = str.replaceAll("(?:/\\*(?:[^*]|(?:\\*+[^*/]))*\\*+/)|(?://.*)", "");
        return res;
    }

    public static String replaceMethod2(String str) {
        StringBuilder sb = new StringBuilder();
        Stack<String> stk = new Stack<>();
        int n = str.length();
        for (int i = 0; i < n - 1; i++) {
            if (stk.empty()) {
                if (str.charAt(i) == '"') {
                    stk.push("\"");
                    sb.append(str.charAt(i));
                } else if (str.charAt(i) == '/' && str.charAt(i + 1) == '*') {
                    stk.push("/*");
                    i++;
                } else if (str.charAt(i) == '/' && str.charAt(i + 1) == '/') {
                    stk.push("//");
                } else {
                    sb.append(str.charAt(i));
                }
            } else if (stk.peek().equals("\"")) {
                if (str.charAt(i) == '"') {
                    stk.pop();
                }
                sb.append(str.charAt(i));
            } else if (stk.peek().equals("/*")) {
                if (str.charAt(i) == '*' && str.charAt(i + 1) == '/') {
                    stk.pop();
                    i++;
                }
            } else if (stk.peek().equals("//")) {
                if (str.charAt(i) == '\n') {
                    stk.pop();
                }
            }
        }
        return sb.toString();
    }
}