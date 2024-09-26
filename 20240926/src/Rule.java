public class Rule {
    public static void main(String[] args) {
        for (int i = 1; i <= 9; i++) {
//            System.out.printf("%d %2d\n", i, i*2);    // 1번 : i의 2배 수열
//            System.out.printf("%d %2d\n", i, i*2-1);  // 2번 : i번째 홀수 수열
//            System.out.printf("%d %2d\n", i, i*i);    // 3번 : i의 제곱근 = i를 두 번씩 곱한 것. i**2 이거 에러남;;
/*            System.out.printf("%d %2d\n", i, (i+2)/3);   4번 : 반복. 3칸에 한 패턴이라 3으로 나눠보았다.
            그랬더니 몫에서도 나머지에서도일정한 패턴이 보였다. 그러던 와중에 원하는 값이 보여서 그걸 가지려면 어떻게 해야되나 하고 보니
            i을 2칸 씩 밀면 내가 원하는 패턴의 값을 손쉽게 얻을 수 있었다 */
//            System.out.printf("%d %2d\n", i, ((i+2)%3)+1);       // 5번 : 순환. 4번 이용하여 비슷한 방식으로 해결
//            System.out.printf("%d %2d\n", i, i++);    // 갑자기 얻은 insight. 이렇게하면 i랑 똘같으면서 홀수인 값이 나옴
//            System.out.printf("%d %2d\n", i, 10-i);   // 6번 : reverse. i와 합이 10이 되는 수열

            System.out.printf("%d %2d %2d %2d %2d %2d %2d\n", i, i*2, i*2-1, i*i, (i+2)/3, ((i+2)%3)+1, 10-i);
        }
    }
}