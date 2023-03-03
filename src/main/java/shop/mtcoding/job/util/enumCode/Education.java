package shop.mtcoding.job.util.enumCode;

public enum Education {
    학력무관(0),
    대졸이상(1),
    고졸이상(2);

    private final int code;

    Education(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static int enumCode(String data) {
        Education education = Education.valueOf(data); // 문자열을 enum 값으로 변환
        int educationCode = education.getCode(); // enum 값을 코드 값으로 변환
        return educationCode;
    }

    public static Education valueOf(int code) {
        for (Education education : values()) {
            if (education.code == code) {
                return education;
            }
        }
        throw new IllegalArgumentException("Invalid value: " + code);
    }
}
