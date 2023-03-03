package shop.mtcoding.job.model.skill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserSkillRepository {

    public List<UserSkill> findAll();

    public List<UserSkill> findByUserId(int userId);

    public int insert(@Param("userId") int userId, @Param("skill") String skill);

    public int updateById(UserSkill skill);

    public int deleteById(int id);
}
