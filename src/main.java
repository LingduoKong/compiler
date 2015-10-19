import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Stack;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

public class main {

    public static void main(String[] args) {
        for (String arg : args) {
            String str = removeComments(arg);
            HashMap<String, String> MacroCode = replaceMacroCode(str);
            String[] strs = Scanner(str, MacroCode);
            for (String s : strs) {
                System.out.println(s);
            }
            run(strs);
        }
    }

    public static void run(String[] tokens) {
        Node last = null;
        Node iterator = null;
        Node node = null;
        for (String token : tokens) {
            if (token.matches("\\s*\\+\\s*") || token.matches("\\s*\\-\\s*")) {
                node = new Node(token, "Operator", last);
            }
            else if (token.matches("\\s*<<\\s*") || token.matches("\\s*>>\\s*") || token.matches("\\s*=\\s*")) {
                node = new Node(token, "Expression", last);
            }
            else if (token.matches("\\s*==\\s*") || token.matches("\\s*\\!=\\s*") || token.matches("\\s*>\\s*") || token.matches("\\s*<\\s*")
                    || token.matches("\\s*<=\\s*") || token.matches("\\s*>=\\s*")) {
                node = new Node(token, "Comparison operation", last);
            }
            else if (token.matches("\\s*\\*\\s*") || token.matches("\\s*/\\s*") || token.matches("\\s*%\\s*")) {
                node = new Node(token, "Multiplicative expression", last);
            }
            else if (token.matches("\\s*if\\s*") || token.matches("\\s*else\\s*") || token.matches("\\s*while\\s*") || token.matches("\\s*do\\s*")
                    || token.matches("\\s*for\\s*") || token.equals("\\s*return\\s*")) {
                node = new Node(token, "Control", last);
            }
            else if (token.matches("\\s*int\\s*") || token.equals("\\s*String\\s*") || token.equals("\\s*extern\\s*")) {
                node = new Node(token, "Type", last);
            }
            else if (token.matches("\\s*,\\s*") || token.matches("\\s*;\\s*")) {
                node = new Node(token, "punctuation", last);
            }
            else if (token.matches("\".*?\"")) {
                node = new Node(token, "CONST-STRING", last);
            }
            else if (token.matches("^\\d+$")) {
                node = new Node(token, "CONST_INT", last);
            }
            else if (token.matches("\\s*\\{\\s*")) {
                node = new Node(token, "Left-bracket", last);
            }
            else if (token.matches("\\s*\\}\\s*")) {
                node = new Node(token, "Right-bracket", last);
            }
            else if (token.matches("\\s*\\[$\\s*")) {
                node = new Node(token, "Left-square", last);
            }
            else if (token.matches("\\s*\\]\\s*")) {
                node = new Node(token, "Right-square", last);
            }
            else if (token.matches("\\s*\\(\\s*")) {
                node = new Node(token, "Left-parenthesis", last);
            }
            else if (token.matches("\\s*\\)\\s*")) {
                node = new Node(token, "Right-parenthesis", last);
            }
            else if (token.matches("\\s*^[a-zA-Z_$][a-zA-Z_$0-9]*$\\s*")) {
                node = new Node(token, "IDENT", last);
            }
            else {
                System.out.println("Compiler Error: " + token);
                System.exit(0);
            }

            if (last == null) {
                iterator = node;
            }
            last = node;
        }
        while (iterator != null) {
            System.out.println(iterator.getValue() + " : " + iterator.getType());
            iterator = iterator.getNext();
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

    public static String[] Scanner(String string, HashMap<String, String> MacroCode) {
        boolean inQuote = false;
        Stack<String> stk = new Stack<>();

        string = string.replaceAll("\\s*#(define|include).*\\n","");

        StringTokenizer stringTokenizer = new StringTokenizer(string, "\"'(){}[],;+-<>=!*/% \n", true);
        while (stringTokenizer.hasMoreTokens()) {
            String tokens = stringTokenizer.nextToken();
            if (!inQuote && Pattern.matches("\\s+", tokens)) {
                continue;
            }
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
                    stk.push(tokens);
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
                    stk.push(tokens);
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