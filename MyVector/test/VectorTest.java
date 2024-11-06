import java.util.Vector;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class VectorTest {
    Vector v = new Vector();  // VectorTest
//    Vector[] objArr = new Vector[3]; // = { null, null, null };
    Object[] objArr = {new Object(), new Object(), new Object()};

    @Test
    public void addTest() {
        assertTrue(v.size()==0);
        v.add(1);
        assertTrue(v.size()==1);
    }

    @Test
    public void stringTest() {
        System.out.println(objArr[0].toString());
        System.out.println(objArr[1].toString());
        System.out.println(objArr[2].toString());
        /* 출력 결과 : 클래스명(getClass().getName()) + '@' + 객체주소
        java.lang.Object@e50a6f6
        java.lang.Object@14ec4505
        java.lang.Object@53ca01a2

        만약에 배열이 비어있는데 출력할 경우 NullPointerException 발생
         */
    }
} // class의 마지막
