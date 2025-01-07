class Exercise6_4 {
    public static void main(String[] args) {
        Student s = new Student();
        s.name = "홍길동";
        s.ban = 1;
        s.no = 1;
        s.kor = 100;
        s.eng = 60;
        s.math = 76;

        System.out.println("이름:" + s.name);
        System.out.println("총점:" + s.getTotal());
        System.out.println("평균:" + s.getAverage());

        Student s2 = new Student("홍길동", 1, 1, 100, 60, 76);

        System.out.println(s.info());
        // 홍길동, 1, 1, 100, 60, 76, 236, 78.7
    }
}

class Student {
    String name;
    int ban;
    int no;
    int kor;
    int eng;
    int math;

    Student() {
    }

    Student(String name, int ban, int no, int kor, int eng, int math) {
        this.name = name;
        this.ban = ban;
        this.no = no;
        this.kor = kor;
        this.eng = eng;
        this.math = math;
    }

    int getTotal() {
        return kor + eng + math;
    }

    // 소수점 두번째 자리에서 반올림
    float getAverage() {
        return (int) (getTotal() / 3f * 10 + 0.5f) / 10f;
//        return (int) (getTotal() / 3f * 100 + 0.5f) / 100f; // 소수점 세번째 자리에서 반올림
//        return getTotal() / 3f; // 평균:78.666664
    }

    String info() {
        return name + ", " + ban + ", " + no + ", " + kor + ", " + eng + ", " + math + ", " + getTotal() + ", " + getAverage();
    }
}
