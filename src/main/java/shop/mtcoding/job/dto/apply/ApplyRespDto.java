package shop.mtcoding.job.dto.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.util.DateUtil;

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

        public String getCreatedAtToString() {
            return DateUtil.format(createdAt);
        }
    }
}