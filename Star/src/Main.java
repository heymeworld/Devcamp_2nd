public class Main {

    public static void main(String[] args) {
        for (int i = 1; i <= 5; i++) {
            for (int j = 1; j <= 5; j++) {
//                if(i+j<=6)              // 왼위 부분 역삼각형
//                if(i>=j)                // 왼아래 부분 역삼각형                
//                if((i+j<=6) && (i>=j))  // 왼의 교집합
//                if(i<=j)                // 오위 부분 역삼각형
//                if(i+j>=6)              // 오아래 부분 역삼각형
//                if((i<=j) && (i+j>=6))  // 오의 교집합
                if(((i+j<=6) && (i>=j)) || ((i<=j) && (i+j>=6)))  // 좌우의 합집합
                    System.out.printf("[%d,%d]", i, j);
                else
                    System.out.printf("     ");
            }
            System.out.println();
        }
    }
}