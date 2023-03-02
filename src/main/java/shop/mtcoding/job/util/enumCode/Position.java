package shop.mtcoding.job.util.enumCode;

public enum Position {
    프론트엔드(0),
    백엔드(1),
    소프트웨어(2),
    안드로이드(3),
    IOS(4),
    네트워크관리자(5),
    머신러닝엔지니어(6),
    데이터엔지니어(7),
    빅데이터엔지니어(8),
    보안엔지니어(9),
    임베디드개발자(10);

    private final int code;

    Position(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static int enumCode(String data) {
        Position position = Position.valueOf(data); // 문자열을 enum 값으로 변환
        int positionCode = position.getCode(); // enum 값을 코드 값으로 변환
        return positionCode;
    }
}
