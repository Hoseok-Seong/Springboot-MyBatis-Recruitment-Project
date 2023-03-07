package shop.mtcoding.job.dto.userSkill;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserMatchingDto {
    private int userId;
    private String enterpriseName;
    private String enterpriseLogo;
    private String title;
    private String sector;
    private int recruitmentId;
}