package shop.mtcoding.job.dto.user;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserMatchingDto {
    private int userId;
    private String enterpriseName;
    private String enterpriseLogo;
    private String title;
}