package shop.mtcoding.job.model.recruitmentPost;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecruitmentPost {
    private int id;
    private int enterpriseId;
    private String title;
    private String career;
    private String education;
    private String pay;
    private String sector;
    private String position;
    private String address;
    private String content;
    private String enterpriseLogo;
    private String deadline;
    private Timestamp createdAt;
}
