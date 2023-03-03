package shop.mtcoding.job.dto.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.util.DateUtil;
import shop.mtcoding.job.util.enumCode.Sector;

public class ApplyReqDto {
    @Setter
    @Getter
    public static class InsertApplyReqDto {
        private int enterpriseId;
        private int recruitmentPostId;
        private Sector sector;
        private int resumeId;
        private Timestamp createdAt;

        public String getCreatedAtToString() {
            return DateUtil.format(createdAt);
        }
    }

    @Getter
    @Setter
    public static class UpdateApplicantResultReqDto {
        private boolean result;
    }
}