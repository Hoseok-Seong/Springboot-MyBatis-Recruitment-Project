package shop.mtcoding.job.dto.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class ApplyRespDto {
    @Getter
    @Setter
    public static class ApplyListForUserRespDto {
        private Integer enterpriseId;
        private Integer recruitmentPostId;
        private String enterpriseName;
        private String title;
        private String sector;
        private Integer resumeId;
        private Timestamp createdAt;
    }
}
