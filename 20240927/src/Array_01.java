// 배열 arr을 읽어서 다음을 출력하시오.
// 1. 중복제거 : 1, 3, 4, 6, 7
// 2. 정렬 : 1, 1, 3, 3, 4, 4, 6, 6, 7, 7, 7
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

public class Array_01 {
    public static void main(String[] args) {
        int[] arr = {4, 1, 3, 7, 6, 6, 3, 4, 1, 7, 7};
//        for (int i = 0; i <= 10; i++) {  // 배열 전체 읽기
//            System.out.print(arr[i]);
//        }
        List<Integer> read = new ArrayList<>();  // 중복 제거
        for (int i = 0; i <= 10; i++) {
            if (!read.contains(arr[i])) {
                read.add(arr[i]);
            }
        }
        System.out.println("1. 중복제거 : " + read);

        List<Integer> seq = new ArrayList<>();  // 정렬
        for (int i = 0; i <= 10; i++) {
            seq.add(arr[i]);
        }
        Collections.sort(seq);
        System.out.print("2. 정렬 : " + seq);
    }
}