class SutdaDeck3 {
    final int CARD_NUM = 20;
    SutdaCard3[] cards = new SutdaCard3[CARD_NUM];

    SutdaDeck3() {
        // 카드는 총 20장
        for (int i = 0; i < cards.length; i++) {
            // 숫자는 1~10까지만
            int num = i % 10 + 1;
            // 첫번째 loop에서만 1, 3, 8 -> isKwang=true
            boolean isKwang = (i < 10) && (num == 1 || num == 3 || num == 8);

            cards[i] = new SutdaCard3(num, isKwang);
        }
    }

    // 배열 cards에 담긴 카드의 위치를 뒤섞는다 (Math.random() 사용)
    void shuffle() {
//        SutdaCard3 tmp = null;
//
//        for (int i = 1; i < 50; i++) {
//            int num = (int) (Math.random() * cards.length);
//            tmp = cards[0];
//            cards[0] = cards[num];
//            cards[num] = tmp;
//        }

        for (int i = 0; i < cards.length; i++) {
            int j = (int) (Math.random() * cards.length);

            //cards[i]와 cards[j]의 값을 서로 바꾼다.
            SutdaCard3 tmp = cards[i];
            cards[i] = cards[j];
            cards[j] = tmp;
        }
    }

    // 배열 cards에 지정된 위치의 SutdaCard를 반환한다
    SutdaCard3 pick(int index) {
        // index의 유효성 검사
        if (index < 0 || index >= CARD_NUM) {
            return null;
        }
        return cards[index];
    }

    // 배열 cards에서 임의의 위치의 SutdaCard를 반환한다 (Math.random() 사용)
    SutdaCard3 pick() {
        return pick((int) (Math.random() * cards.length));
    }
}

class SutdaCard3 {
    int num; // 카드의 숫자 (1~10사이의 정수)
    boolean isKwang; // 광이면 true, 아니면 false

    SutdaCard3() {
        this(1, true);
    }

    SutdaCard3(int num, boolean isKwang) {
        this.num = num;
        this.isKwang = isKwang;
    }

    // info() 대신 Object 클래스의 toString을() 을 오버라이딩했다
    @Override
    public String toString() {
        return num + (isKwang ? "K" : "");
    }
}

class Exercise7_2 {
    public static void main(String[] args) {
        SutdaDeck3 deck = new SutdaDeck3();

        System.out.println(deck.pick(0));
        System.out.println(deck.pick());
        deck.shuffle();

        for (int i = 0; i < deck.cards.length; i++)
            System.out.print(deck.cards[i] + ",");

        System.out.println();
        System.out.println(deck.pick(0));
    }
}
