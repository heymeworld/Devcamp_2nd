import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

public class MyVectorTest {
    // Object 배열 테스트
    @Test public void Test2_1() {
        MyVector v = new MyVector();
        assertNull(v.getObjArr());
    }
    
    // MyVector 클래스 생성자 테스트
    @Test
    public void Test2_2() {
        MyVector v1 = new MyVector();
        Object[] v1Arr = v1.getObjArr();
        assertTrue(v1Arr.length==16);


        MyVector v2 = new MyVector(20);
        Object[] v2Arr = v2.getObjArr();
        assertTrue(v2.capacity()==20);
    }
    
    // size(), capacity() 테스트
    @Test
    public void Test2_3() {
        MyVector v1 = new MyVector();
        assertTrue(v1.size()==0);
        assertTrue(v1.capacity()==16);
        assertTrue(v1.isEmpty());

        MyVector v2 = new MyVector(5);
        assertTrue(v2.capacity()==5);
    }
    
    // add(Object obj) 테스트
    @Test
    public void Test2_4() {
        MyVector v = new MyVector();
        v.add(new MyVector());  // new Object()는 왜 안 되지? -> ArrayStoreException; 생성자 MyVector(int capacity) 때문에
        assertTrue(v.size()==1);
    }

    // Object get(int index) 테스트
    @Test
    public void Test2_5() {
        MyVector v1 = new MyVector();
        v1.add(new MyVector());
        assertNotNull(v1.get(0));

        assertNotNull(v1.get(1));
        System.out.println("해당 인덱스는 " + v1.get(1) + " 상태 입니다.");

         Optional<MyVector> opt = v1.get(1);
         // isPresent() : Optional 객체가 값을 가지고 있다면 true, 값이 없다면 false 리턴
         assertFalse(opt.isPresent());  // opt 대신 v1.get(1) 써도 됨
         // message : true 이면 출력X, false 면 메세지 출력됨 (AssertionFailedError: 해당 index에는 객체가 없습니다. ==>)
         //assertTrue(opt.isPresent(), "해당 index에는 객체가 없습니다.");
    }

//    @Test
//    public void Test2_6() {
//        MyVector v = new MyVector();
//        v.add();
//    }


} // class 끝.
