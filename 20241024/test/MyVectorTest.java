import org.junit.jupiter.api.Test;

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

         // Optional<MyVector> opt = v1.get(1);
         // isPresent() : Optional 객체가 값을 가지고 있다면 true, 값이 없다면 false 리턴
         // assertFalse(opt.isPresent());  // opt 대신 v1.get(1) 써도 됨
         // message : true 이면 출력X, false 면 메세지 출력됨 (AssertionFailedError: 해당 index 에는 객체가 없습니다. ==>)
         //assertTrue(opt.isPresent(), "해당 index 에는 객체가 없습니다.");
    }

    // toString() Test
    @Test
    public void Test2_6() {
        MyVector v = new MyVector();
        v.add(new MyVector());
        v.add(new MyVector(17));
        v.add(new MyVector(18));
        assertEquals(3, v.size());
        System.out.println(v);
    }

    // indexOf() Test
    @Test
    public void Test2_7() {
        MyVector v = new MyVector();
        v.add(new MyVector());
        v.add(new MyVector(17));
        v.add(new MyVector(18));

        //v.indexOf(v.get(1));  // 내용물이 같아도 Optional 을 쓸 때마다, 주소가 바뀌어서 절대 (==) 조건이 성립할 수 없다

        // Optional.get() : Optional 에서 값을 꺼낼 때
        assertEquals(0, v.indexOf(v.get(0).get()));
        assertEquals(2, v.indexOf(v.get(2).get()));
        assertEquals(1, v.indexOf(v.get(1).get()));

        // .orElse(null) : Optional 이 비어 있는 경우 null을 반환하여 안전하게 비교하도록 합니다.
        assertEquals(-1, v.indexOf(v.get(3).orElse(null)));
    }

    // remove() Test
    @Test
    public void Test2_8() {
        MyVector v = new MyVector();
        v.add(new MyVector());
        v.add(new MyVector(17));
        v.add(new MyVector(18));
        System.out.println("현재 " + v.size() + " 개의 요소가 있습니다.");
        System.out.println();

        assertTrue(v.remove(v.get(2).get()));
        System.out.println("현재 " + v.size() + " 개의 요소가 있습니다.");
        // isPresent() : Optional 객체가 값을 가지고 있다면 true, 값이 없다면 false 리턴
        assertFalse(v.get(2).isPresent());

        assertFalse(v.remove(v.get(3).orElse(null)));
    }

} // class 끝.
