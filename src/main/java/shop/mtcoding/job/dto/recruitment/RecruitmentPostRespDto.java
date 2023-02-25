package shop.mtcoding.job.dto.recruitment;

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
}
