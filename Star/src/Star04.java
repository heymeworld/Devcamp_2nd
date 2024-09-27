public class Star04 {

    public static void main(String[] args) {
        for (int i = 0; i <= 1; i++) {
            System.out.print("*");
            for (int j = i; j <= 2-i; j++) {
                System.out.print(" ");
            }
            System.out.print("*\n");
            for (int j = 0; j <= i; j++) {
                System.out.print(" ");
            }
        }
        System.out.print("*\n");
        System.out.print(" ");
        for (int i = 0; i <= 1; i++) {
            for (int j = i; j <= i; j++) {
                System.out.print("*");
            }
            for (int k = -i; k <= i; k++) {
                System.out.print(" ");
            }
            System.out.print("*\n");
        }
    }
}