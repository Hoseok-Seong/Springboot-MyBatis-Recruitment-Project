package shop.mtcoding.job.dto.recruitmentPost;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class RecruitmentPostRespDto {

    @Getter
    @Setter
    public static class BoardRespDto {
        private Integer id;
        private String title;
        private String enterpriseName;
        private Timestamp createdAt;
    }
}
