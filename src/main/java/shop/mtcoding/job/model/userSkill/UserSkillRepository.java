package shop.mtcoding.job.model.userSkill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.job.dto.userSkill.UserMatchingDto;

@Mapper
public interface UserSkillRepository {

    public List<UserSkill> findAll();

    public UserSkill findById(int id);

    public int insert(@Param("userId") int userId, @Param("skill") Integer skill);

    public int updateById(UserSkill userSkill);

    public int deleteById(int id);

    public int deleteByUserId(int userId);

    public List<UserMatchingDto> userMatching(int id);

    public List<UserSkill> findByUserId(int userId);

}