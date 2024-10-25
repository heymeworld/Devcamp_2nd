public class MyVector {
    // Q2-1. Object 배열을 인스턴스 변수 정의 ############################################################################
    Object[] objArr = new Object[3];
//    Object[] objArr = {new Object(), new Object(), new Object()};

    public Object[] getObjArr() { return objArr; }

    public Object[] setObjArr(int n) {
        this.objArr = new Object[n];
        return this.objArr;
    }

    // Q2-2. MyVector 기본 생성자, 매개변수 생성자 정의 ###################################################################
    int capacity; // iv는 자동 초기화 0;

    MyVector() {
        this(16);
    }

    MyVector(int capacity) {
        this.capacity = capacity;
    }

    // Q2-3. 객체 배열의 size 와 capacity ##############################################################################
    int size;

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
        boolean result = false;

        for (int i=0; i<objArr.length; i++) {
            if (objArr[i] == null)
                result = true;
//            else result = false;
        }
        return result;
    }
}

