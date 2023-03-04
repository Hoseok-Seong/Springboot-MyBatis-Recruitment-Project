package shop.mtcoding.job.dto.recruitmentSkill;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class EnterpriseMatchingDto {
    private int enterpriseId;
    private String username;
    private String email;
    private int skill;
    private String birthdate;
    private String title;
    private String contant;
}
