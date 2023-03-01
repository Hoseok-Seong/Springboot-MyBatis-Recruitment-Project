package shop.mtcoding.job.model.skill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface RecruitmentSkillRepository {

    public List<UserSkill> findAll();

    public UserSkill findById(int id);

    public int insert(@Param("recruitmentId") int recruitmentId, @Param("skill") String skill);

    public int updateById(UserSkill skill);

    public int deleteById(int id);
}