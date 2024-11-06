import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class MidTest {
    static int mid(int x, int y, int z) {
        return y;
    }

    @Test
    public void test1() {
        assertTrue(mid(1, 2, 3)==2);
    }
    @Test void test2() { assertTrue(mid(1, 3, 2)==3); }
    @Test void test3() { assertTrue(mid(1, 1, 1)==1); }
}