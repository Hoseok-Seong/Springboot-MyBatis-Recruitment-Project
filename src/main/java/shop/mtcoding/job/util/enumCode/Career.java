package shop.mtcoding.job.util.enumCode;

public enum Career {
    경력(0),
    신입(1),
    무관(2);

    private final int code;

    Career(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static int enumCode(String data) {
        Career career = Career.valueOf(data); // 문자열을 enum 값으로 변환
        int careerCode = career.getCode(); // enum 값을 코드 값으로 변환
        return careerCode;
    }
}
