/**
 * Created by fubo on 10/17/15.
 */
public class Node {
    private String value;
    private String type;
    private Node next;

    public Node(String value, String type, Node last) {
        this.value = value;
        this.type = type;
        if (last != null) {
            last.setNext(this);
        }
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Node getNext() {
        return next;
    }

    public void setNext(Node next) {
        this.next = next;
    }
}
