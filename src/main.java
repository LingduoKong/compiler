import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Stack;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

public class main {

    private static HashMap<String, String> MacroCode;
    public static void main(String[] args) {
        String str = removeComments("lib.c");
        MacroCode = replaceMacroCode(str);
        String[] strs = Scanner(str);
        for (String s : strs) {
            System.out.println(s);
        }
    }

    public static HashMap<String, String> replaceMacroCode(String string) {
        HashMap<String, String> hashMap = new HashMap<>();
        String[] temps = string.split("\n");
        for (String temp : temps) {
            if (Pattern.matches("(#define)(\\s+)([A-Z]+)(\\s+)(..*)", temp)) {
                String[] strs = temp.split("\\s+");
                if (strs.length != 3) {
                    System.out.println("macro code error!");
                    return null;
                }
                hashMap.put(strs[1], strs[2]);
            }
        }
        return hashMap;
    }

    public static String[] Scanner(String string) {
        boolean inQuote = false;
        Stack<String> stk = new Stack<>();
        StringTokenizer stringTokenizer = new StringTokenizer(string, "\"'(){},;+-<>=!*/% ", true);
        while (stringTokenizer.hasMoreTokens()) {
            String tokens = stringTokenizer.nextToken();
            if (tokens.equals("\"")) {
                if (inQuote) {
                    String str = stk.pop();
                    str += tokens;
                    stk.push(str);
                } else {
                    stk.push(tokens);
                }
                inQuote = !inQuote;
                continue;
            }
            if (inQuote) {
                String str = stk.pop();
                str += tokens;
                stk.push(str);
            } else {
                if (MacroCode!= null && MacroCode.containsKey(tokens)) {
                    tokens = MacroCode.get(tokens);
                }
                if (stk.empty()) {
                    if (!Pattern.matches("(?m)^\\s*$", tokens)) {
                        stk.push(tokens);
                    }
                } else if (stk.peek().equals("<") && tokens.equals("<")
                        || stk.peek().equals(">") && tokens.equals(">")
                        || stk.peek().equals(">") && tokens.equals("=")
                        || stk.peek().equals("<") && tokens.equals("=")
                        || stk.peek().equals("=") && tokens.equals("=")
                        || stk.peek().equals("!") && tokens.equals("=")
                        ) {
                    String str = stk.pop();
                    str += tokens;
                    stk.push(str);
                } else {
                    if (!Pattern.matches("(?m)^\\s*$", tokens)) {
                        stk.push(tokens);
                    }
                }
            }
        }
        String[] ar = new String[stk.size()];
        stk.toArray(ar);
        return ar;
    }



    public static String removeComments(String readingFilePath) {
        Path path = Paths.get(readingFilePath);
        String result = null;
        try {
            InputStream in = Files.newInputStream(path);
            BufferedReader reader = new BufferedReader((new InputStreamReader(in)));
            String str;
            StringBuilder sb = new StringBuilder();
            while ((str = reader.readLine()) != null) {
                sb.append(str + "\n");
            }
            result = replaceMethod(sb.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String replaceMethod(String str) {
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
        if (!stk.empty()) {
            System.out.println("comments error");
        }
        return sb.toString();
    }
}