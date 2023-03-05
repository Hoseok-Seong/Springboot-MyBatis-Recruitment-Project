package shop.mtcoding.job.model.recruitmentSkill;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecruitmentSkill {
    private int id;
    private int recruitmentId;
    private List<Integer> skill;
}