import java.util.HashMap;

public class Calculator {
//    public static final int PROGRAM = 0;
//    public static final int EXTERNAL_DECLARATION = 1;
//    public static final int DECLARATION = 2;
//    public static final int FUNCTION = 3;
//    public static final int TYPE = 4;
//    public static final int LIST_DECLARATION = 5;
//    public static final int DEC = 6;
//    public static final int PARAMETER_LIST = 7;
//    public static final int PARAMETER_DECLARATION = 8;
//    public static final int INSTRUCTION = 9;
//    public static final int INSTRUCTION_EXPRESSION = 10;
//    public static final int AFFECTION = 11;
//    public static final int COMPOSED_INSTRUCTION = 12;
//    public static final int LIST_INSTRUCTIONS = 13;
//    public static final int INSTRUCTION_SELECT = 14;
//    public static final int INSTRUCTION_TEST = 15;
//    public static final int INSTRUCTION_ITERATION = 16;
//    public static final int INSTRUCTION_JUMP = 17;
//    public static final int CONDITION = 18;
//    public static final int COMPARISON_OPERATOR = 19;
//    public static final int ADDITION_EXPRESSION = 20;
//    public static final int MULTIPLICATION_EXPRESSION = 21;
//    public static final int UNARY_EXPRESSION = 22;
//    public static final int POSTFIX_EXPRESSION = 23;
//    public static final int ARGUMENT_EXPRESSION_LIST = 24;
//    public static final int EXPRESSION_PRIMAIRE = 25;
//    public static final int IDENTIFIER = 26;

    int state = 0;
    String errorMessage;

    public static void main(String[] args) {
        Lexer lexer = new Lexer();
        String str = lexer.removeComments("lib.c");
        String[] tokens = lexer.Scanner(str);
        new Calculator().run(tokens);
    }

    public void run(String[] tokens) {
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

}
