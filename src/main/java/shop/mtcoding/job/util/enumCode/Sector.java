package shop.mtcoding.job.util.enumCode;

public enum Sector {
    SI(0),
    웹에이전시(1),
    인력소싱(2),
    대기업(3),
    스타트업(4),
    서비스(5),
    컨설팅(6);

    private final int code;

    Sector(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static int enumCode(String data) {
        Sector sector = Sector.valueOf(data); // 문자열을 enum 값으로 변환
        int sectorCode = sector.getCode(); // enum 값을 코드 값으로 변환
        return sectorCode;
    }

    public static Sector valueOf(int code) {
        for (Sector sector : values()) {
            if (sector.code == code) {
                return sector;
            }
        }
        throw new IllegalArgumentException("Invalid value: " + code);
    }
}
