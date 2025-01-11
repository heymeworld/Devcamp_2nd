public class Exercise6_22 {

    public static boolean isNumber(String str) {
        if (str == null || str.isEmpty())
            return false;
        // 숫자인지 어찌 판별할까요
        try { Integer.parseInt(str); }
        catch (NumberFormatException e) { return false; }
        return true;
    }

    public static void main (String[] args) {
        String str = "123";
        System.out.println(str+"는 숫자입니까? "+isNumber(str));

        str = "1234o";
        System.out.println(str+"는 숫자입니까? "+isNumber(str));
    }
}
