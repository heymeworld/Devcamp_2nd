import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class MyVectorTest {
    // Object 배열 테스트
    @Test public void objTest() {
        MyVector v = new MyVector();
        Object[] objArr = v.getObjArr();
        assertTrue(objArr.length==3); }
    
    // MyVector 클래스 생성자 테스트
    @Test
    public void getCapacity() {
        MyVector v1 = new MyVector();
        assertTrue(v1.capacity==16);


        MyVector v2 = new MyVector(20);
        assertTrue(v2.capacity==20);
    }
    
    // size(), capacity() 테스트
    @Test
    public void getObjSize() {
        MyVector v = new MyVector();
        assertTrue(v.size()==0);
        assertTrue(v.capacity()==3);
        assertTrue(v.isEmpty());

        v.setObjArr(5);
        assertTrue(v.capacity()==5);
    }

//    @Test
//    public void test() {
//        MyVector v = new MyVector();
//        assertTrue(v.setObjArr(5)==5);
//    }
}
