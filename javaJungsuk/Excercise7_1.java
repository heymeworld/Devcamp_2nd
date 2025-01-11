class SutdaDeck {
    final int CARD_NUM = 20;
    SutdaCard2[] cards = new SutdaCard2[CARD_NUM];

    // 카드는 총 20장, 숫자는 1~10
    // 총 2번 loop 돌아야 함, 첫번째 loop에서만 1, 3, 8 -> isKwang=true
    SutdaDeck() {
//        for (int i = 0; i < 2; i++) {
//            if (i == 0) {
//                for (int j = 0; j < 10; j++) {
//                    if (j == 0 || j == 2 || j == 7)
//                        cards[j] = new SutdaCard2(j + 1, true);
//                    else cards[j] = new SutdaCard2(j + 1, false);
//                }
//            }
//            if (i == 1) {
//                for (int j = 0; j < 10; j++)
//                    cards[j + 10] = new SutdaCard2(j + 1, false);
//            }
//        }
        for (int i = 0; i < CARD_NUM; i++) {
            int num = i % 10 + 1;
            boolean isKawng = (i < 10) && (num == 1 || num == 3 || num == 8);
            
            cards[i] = new SutdaCard2(num, isKawng);
        }
    }
}

class SutdaCard2 {
    int num; // 카드의 숫자 (1~10사이의 정수)
    boolean isKwang; // 광이면 true, 아니면 false

    SutdaCard2() {
        this(1, true);
    }

    SutdaCard2(int num, boolean isKwang) {
        this.num = num;
        this.isKwang = isKwang;
    }

    // info() 대신 Object 클래스의 toString을() 을 오버라이딩했다
    @Override
    public String toString() {
        return num + (isKwang ? "K" : "");
    }
}

class Excercise7_1 {
    public static void main(String[] args) {
        SutdaDeck deck = new SutdaDeck();

        for (int i = 0; i < deck.cards.length; i++)
            System.out.print(deck.cards[i] + ",");
    }
}
