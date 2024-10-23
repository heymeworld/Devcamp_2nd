// 2차원 배열을 골고루 섞은 다음에 다시 1차원 배열에 저장하고 출력하는 코드를 작성하시오.

import java.util.*;

public class ArrayEx2 {
    static public void main(String[] args) {
        int[] arr = new int[25];
        int[][] arr2 = new int[5][5];

        // 1차원 배열 arr 초기화
        for(int i=0; i<arr.length; i++) { arr[i] = i+1; }

        // 1차원 배열 arr 을 2차원 배열 arr2에 복사하기
        for(int i=0, start=0, stop=arr2.length; i<arr2.length; i++, start+=5, stop+=5) {
            arr2[i] = Arrays.copyOfRange(arr, start, stop);
        }

        // 2차원 배열 arr2를 골고루 섞는 메서드. 100번이면 충분히 골고루 섞임
        for(int i=0; i<100; i++) {
            int n=(int)(Math.random() * 5);
            int m=(int)(Math.random() * 5);
            int tmp = arr2[0][0];
            arr2[0][0] = arr2[n][m];
            arr2[n][m] = tmp;
        }

        // 1차원 배열 arr 의 인덱스
        int pos=0;

        // 2차원 배열 arr2를 1차원 배열 arr 에 복사
        for(int i=0; i<arr2.length; i++) {
            for(int j=0; j<arr2[i].length; j++) {
                arr[pos]=arr2[i][j];
                pos++;
            }
        }
        
        // 골고루 섞인 배열 arr 과 arr2 출력
        System.out.println("arr = " + Arrays.toString(arr));
        System.out.println("arr2 = " + Arrays.deepToString(arr2));
    }
}
