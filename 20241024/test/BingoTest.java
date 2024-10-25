import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class BingoTest {
    static int bingocount = 0;

    static int bingoCount(int[][] arr) {
        // 1. 가로 세기
        for (int i = 0; i < arr.length; i++) {
            int cnt = 0;
            for (int j = 0; j < arr[i].length; j++) {
                // 1의 개수를 센다. 5개면 빙고
                if (arr[i][j] == 1)
                    cnt++;
            }
            if (cnt == 5) bingocount++;
        }

        // 2. 세로 세기
        for (int i = 0; i < arr.length; i++) {
            int cnt = 0;
            for (int j = 0; j < arr.length; j++) {
                // 1의 개수를 센다. 5개면 빙고
                if (arr[j][i] == 1)
                    cnt++;
            }
            if (cnt == 5) bingocount++;
        }

        // 3. 대각선 세기
        int cnt = 0;
        for (int i = 0; i < arr.length; i++) {
            // 대각선 1의 개수를 센다. 5개면 빙고
            if (arr[i][i] == 1)
                cnt++;
        }

        for (int i = 0; i < arr.length; i++) {
            // 1의 개수를 센다. 5개면 빙고
            if (arr[i][4-i] == 1)
                cnt++;
        }
        bingocount+=(cnt/5);

        return bingocount;
    }

    @Test
    public void test1() {
        int[][] arr = {{1, 1, 1, 1, 1},
                       {1, 1, 1, 1, 1},
                       {1, 1, 1, 1, 1},
                       {1, 1, 1, 1, 1},
                       {1, 1, 1, 1, 1}};
        assertTrue(bingoCount(arr)==12);
    }
    @Test
    public void test2() {
        int[][] arr = {{1, 0, 1, 0, 1},
                       {0, 1, 1, 1, 0},
                       {1, 1, 1, 1, 1},
                       {0, 1, 1, 1, 0},
                       {1, 0, 1, 0, 1}};
        assertTrue(bingoCount(arr)==4);
    }
    @Test
    public void test3() {
        int[][] arr = {{0, 0, 0, 0, 0},
                       {0, 0, 0, 0, 0},
                       {0, 0, 0, 0, 0},
                       {0, 0, 0, 0, 0},
                       {0, 0, 0, 0, 0}};
        assertTrue(bingoCount(arr)==0);
    }
}
