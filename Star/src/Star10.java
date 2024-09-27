public class Star10 {

    public static void main(String[] args) {
        for (int i = 0; i <= 1; i++) {
            for (int j = 0; j <= i; j++) {
                System.out.print("*");
            }
            for (int k = i; k <= 2-i; k++) {
                System.out.print(" ");
            }
            for (int j = 0; j <= i; j++) {
                System.out.print("*");
            }
            System.out.print("\n");
        }
        System.out.print("*****\n");

        for (int i = 0; i <= 1; i++) {
            for (int j = 1; j >= i; j--) {
                System.out.print("*");
            }
            for (int k = -i; k <= i; k++) {
                System.out.print(" ");
            }
            for (int j = 1; j >= i; j--) {
                System.out.print("*");
            }
            System.out.print("\n");
        }
    }
}