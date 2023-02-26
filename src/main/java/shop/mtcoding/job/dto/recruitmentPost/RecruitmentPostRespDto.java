package shop.mtcoding.job.dto.recruitmentPost;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class RecruitmentPostRespDto {

    @Setter
    @Getter
    public static class RecruitmentPostDetailRespDto {
        private Integer id;
        private String enterpriseId;
        private String title;
        private String career;
        private String education;
        private String pay;
        private String sector;
        private String position;
        private String content;
        private String address;
        private String enterpriseName;
        private Timestamp createdAt;
    }

    @Setter
    @Getter
    public static class RecruitmentPostListRespDto {
        private Integer id;
        private String enterpriseId;
        private String title;
        private String career;
        private String education;
        private String pay;
        private String sector;
        private String position;
        private String content;
        private String address;
        private String enterpriseLogo;
        private String enterpriseName;
        private Timestamp createdAt;
    }

    @Getter
    @Setter
    public static class PostRespDto {
        private Integer id;
        private String title;
        private String enterpriseName;
        private String enterpriseLogo;
        private Timestamp createdAt;
    }

}
