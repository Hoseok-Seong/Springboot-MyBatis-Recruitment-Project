package shop.mtcoding.job.dto.apply;

import lombok.Getter;
import lombok.Setter;

public class ApplyReqDto {
    @Setter
    @Getter
    public static class InsertApplyReqDto {

        private int enterpriseId;
        private int recruitmentPostId;
        private String sector;
        private int resumeId;

    }
}
