package shop.mtcoding.job.dto.apply;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.model.apply.Apply;

public class ApplyReqDto {
    @Setter
    @Getter
    public static class InsertApplyReqDto {

        private int userId;
        private int enterpriseId;
        private String field;

        public Apply toModel(int userId) {
            Apply apply = new Apply();
            apply.setUserId(userId);
            apply.setEnterpriseId(enterpriseId);
            apply.setField(field);
            return apply;
        }
    }
}
