// 3개의 정수를 받아서 중간 크기의 값을 반환하는 mid()를 작성하시오.
import java.util.Scanner;

class Math_Group {
    // 최대값을 구하는 메서드
//    public int max(int a, int b, int c) {
//        int tmp = 0;
//        if (a > b && a > c) {
//            tmp = a;
//        } else if (b > a && b > c) {
//            tmp = b;
//        } else if (c > b && c > a) {
//            tmp = c;
//        }
//        return tmp;
//    }

    // 중간값을 구하는 메서드
    public int mid(int a, int b, int c) {
        int tmp = 0;
        if ((b <= a && a <= c) || (c <= a && a <= b)) {
            tmp = a;
        } else if ((a <= b && b <= c) || (c <= b && b <= a)) {
            tmp = b;
        } else {
            tmp = c;
        }
        return tmp;
    }
}

public class Method_01 {
    public static void main(String[] args) {
        // Scanner 객체 생성
        Scanner sc = new Scanner(System.in);

        // 사용자에게 입력 요청
        System.out.print("정수 3개를 입력하세요.: ");

        // 입력값 읽기
        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();

        // Math_Group 클래스의 인스턴스 생성
        Math_Group Midle = new Math_Group();
        int middle = Midle.mid(a, b, c); // mid 메서드 호출
        System.out.println("mid : " + middle); // 결과 출력

        // Scanner 닫기
        sc.close();
    }
}