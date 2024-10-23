// 3개의 정수가 저장된 두 개의 배열 arr 과 arr2를 비교해서 두 배열에 저장된 값이 모두 같으면 "같습니다."를, 다르면 "다릅니다."를 출력하는 코드를 작성하시오.

public class ArrayEx3 {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3};
        int[] arr2 = {1, 2, 3};
        boolean[] tmp = {false, false, false};  // boolean 타입 배열 초기화
        
        // 같은 인덱스 자리에 같은 값을 가지고 있다면 임시 배열 tmp 에 true 를 저장
        for(int i=0; i<arr.length; i++) {
            if(arr[i]==arr2[i])
                tmp[i]=true;
        }
        
        // 임시 배열 tmp의 모든 값이 true 라면, "같습니다." 출력
        if(tmp[0]&&tmp[1]&&tmp[2])
            System.out.println("arr과 arr2는 같습니다.");
        else System.out.println("arr과 arr2는 다릅니다.");
    }
}