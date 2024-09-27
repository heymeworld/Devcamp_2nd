public class Star09 {

    public static void main(String[] args) {
        for (int i = 0; i <= 1; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print(" ");
            }
            for (int k = i; k <= 4-i; k++) {
                System.out.print("*");
            }
            System.out.print("\n");
        }
        for (int i = 0; i <= 2; i++) {
            for (int j = 0; j <= 1-i; j++) {
                System.out.print(" ");
            }
            for (int k = 4-i; k <= i+4; k++) {
                System.out.print("*");
            }
            System.out.print("\n");
        }
    }
}