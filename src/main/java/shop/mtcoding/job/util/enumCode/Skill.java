package shop.mtcoding.job.util.enumCode;

public enum Skill {
    Java(0),
    Html(1),
    JavaScript(2),
    VueJS(3),
    CSS(4),
    NodeJs(5),
    React(6),
    ReactJS(7),
    Typescript(8),
    Zustand(9),
    AWS(10);

    private final int code;

    Skill(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static int enumCode(String data) {
        Skill skill = Skill.valueOf(data); // 문자열을 enum 값으로 변환
        int skillCode = skill.getCode(); // enum 값을 코드 값으로 변환
        return skillCode;
    }
}
