package shop.mtcoding.job.model.recruitmentPost;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecruitmentPost {
    private int id;
    private String enterpriseId;
    private String title;
    private String content;
    private String enterpriseLogo;
    private String address;
    private Timestamp createdAt;
}
