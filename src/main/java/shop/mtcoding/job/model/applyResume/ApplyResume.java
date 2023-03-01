package shop.mtcoding.job.model.applyResume;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApplyResume {
    private int recruitmentPostId;
    private int id;
    private int userId;
    private String title;
    private String content;
    private String career;
    private String education;
    private String skill;
    private String award;
    private String language;
    private String link;
    private String file;
    private String birthdate;
    private String address;
    private boolean finish;
    private Timestamp createdAt;
}
