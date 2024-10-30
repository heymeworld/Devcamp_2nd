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
        this.capacity = capacity;
    }

    // Q2-3. 객체 배열의 size 와 capacity ##############################################################################
    private int size;

    public int size() { return size; }

    public int capacity() {
//        capacity = objArr.length;
        return capacity;
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
        if (size < objArr.length) {
            objArr[size] = v;  // ptr -> size = 0; 부터 시작하니(index 도 0부터 시작), 값을 추가한(size++) 다음에는 ptr이 다음 인덱스를 가리키고 있다고 생각하면 됨
            size++;            // 요소 추가 후 size 증가
            System.out.println("An obj is added");
        }
            // System.out.println("Object[] objArr is already full.");
    }

    // Q2-5. 객체 배열 objArr 에 저장된 객체를 반환하는 메서드 ##############################################################
    public Optional<MyVector> get(int index) {
        if (index < 0 || index >= size) {
        System.out.println("index 값이 적절하지 않습니다.");
        return Optional.empty();
        }
        // getNaked()는 null 을 반환할 수 있음
        return Optional.ofNullable(getNaked(index)); // Optional 로 감싸서 최종 반환
    }

    private MyVector getNaked(int index) { return (MyVector) objArr[index]; }

    // Q2-6. 객체 배열 objArr 에 저장된 모든 객체를 문자열로 이어서 반환하도록 toString()을 오버라이딩 ###########################
    @Override  // 1.선언부 똑같게 2.접근 제어자 좁게X 3.예외 많게X
    public String toString() {
        String s = "";
        for (int i=0; i<size; i++) {
            if (s != "")
                s += ", ";
            s += objArr[i].getClass().getName() + "@" + Integer.toHexString(objArr[i].hashCode());
        }
        return s;
    }

    // Q2-7. 객체 배열 objArr 에 저장된 객체의 인덱스를 반환하는 메서드 #######################################################
    public int indexOf(Object obj) {
        for (int i=0; i<size; i++) {
            if (obj == getNaked(i))
                return i;
        }
        System.out.println("입력하신 객체가 없습니다.");
        return -1;
    }

    // Q2-8. 객체 배열 objArr 에 저장된 객체를 삭제하는 메서드 ##############################################################
    // indexOf() 를 이용할 것
    public boolean remove(Object obj) {
        if (indexOf(obj) != -1) {
            System.out.println("index[" + indexOf(obj) + "] : 입력하신 객체를 삭제하였습니다.");
            objArr[indexOf(obj)] = null;
            size--;
            return true;
        }
        return false;
    }

} // class 끝.

