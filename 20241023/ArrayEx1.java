// 1~25가 저장된 1차원 배열 arr 을 5*5 크기의 2차원 배열 arr2에 저장하고 출력하는 코드를 작성하시오.

import java.util.Arrays;

public class ArrayEx1 {
    public static void main(String[] args) {
        int[] arr = new int[25];
        int[][] arr2 = new int[5][5];
        
        // 1차원 배열 arr 초기화
        for(int i=0; i<arr.length; i++) { arr[i] = i+1; }
        
        // 1차원 배열 arr 을 2차원 배열 arr2에 복사하기
        for(int i=0, start=0, stop=arr2.length; i<arr2.length; i++, start+=5, stop+=5) {
            arr2[i] = Arrays.copyOfRange(arr, start, stop);
        }
        
        // 2차원 배열 출력
        System.out.println("arr2 : " + Arrays.deepToString(arr2));
    }
}
