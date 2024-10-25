import java.util.Optional;

public class MyVector {
    // Q2-1. Object 배열을 인스턴스 변수 정의 ############################################################################
    private Object[] objArr;
//    Object[] objArr = {new MyVector(), new MyVector(), new MyVector()};

    public Object[] getObjArr() { return objArr; }

//    생각해보니, 생성자 있어서 필요없음
//    public Object[] setObjArr() {
//        this.objArr = new MyVector[capacity];
//        return this.objArr;
//    }

    // Q2-2. MyVector 기본 생성자, 매개변수 생성자 정의 ###################################################################
    private int capacity; // iv는 자동 초기화 0;

    MyVector() {
        this(16);
    }

    MyVector(int capacity) {
        this.objArr = new MyVector[capacity];
    }

    // Q2-3. 객체 배열의 size 와 capacity ##############################################################################
    private int size;

    public int size() {
        for (int i=0; i<objArr.length; i++) {
            if (objArr[i] != null)
                size++;
        }
        return size;
    }

    public int capacity() {
        return objArr.length;
    }

    public boolean isEmpty() {
        for (int i=0; i<objArr.length; i++) {
            if (objArr[i] != null)
                return false;
//            else result = false;
        }
        return true;
    }

    // Q2-4. 객체 배열 objArr 에 객체를 추가하는 메서드 #####################################################################
    public void add(MyVector v) {
        for (int i=0; i<objArr.length; i++) {
            if (objArr[i] == null) {
                objArr[i] = v;
                System.out.println("An obj is added");
                break;
            }
            System.out.println("Object[] objArr is already full.");
        }
    }

    // Q2-5. 객체 배열 objArr 에 저장된 객체를 반환하는 메서드 ##############################################################
    public Optional<MyVector> get(int index) {
        MyVector v = getNaked(index); // getNaked()는 null 을 반환할 수 있음
        return Optional.ofNullable(v); // Optional 로 감싸서 최종 반환
    }

    private MyVector getNaked(int index) { return (MyVector) objArr[index]; }

    // Q2-6. 객체 배열 objArr 에 저장된 모든 객체를 문자열로 이어서 반환하도록 toString()을 오버라이딩 ###########################
    @Override  // 1.선언부 똑같게 2.접근 제어자 좁게X 3.예외 많게X
    public String toString() {
        return "Object[" + capacity + "]";
    }


} // class 끝.

