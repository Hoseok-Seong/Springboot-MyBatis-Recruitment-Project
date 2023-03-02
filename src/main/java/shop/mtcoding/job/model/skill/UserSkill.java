package shop.mtcoding.job.model.skill;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserSkill {
    private int id;
    private int userId;
    private List<String> skill;
}
