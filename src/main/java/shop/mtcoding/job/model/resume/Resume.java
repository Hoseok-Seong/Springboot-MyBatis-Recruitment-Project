package shop.mtcoding.job.model.resume;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Resume {
    private int id;
    private int userId;
    private String title;
    private String content;
    private String profile;
    private int age;
    private String address;
    private String career;
    private String education;
    private String position;
    private String field;
    private Timestamp createdAt;
}
