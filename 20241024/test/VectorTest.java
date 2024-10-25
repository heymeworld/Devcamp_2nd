import java.util.Vector;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class VectorTest {
    Vector v = new Vector();  // VectorTest

    @Test
    public void addTest() {
        assertTrue(v.size()==0);
        v.add(1);
        assertTrue(v.size()==1);
    }
} // class의 마지막
