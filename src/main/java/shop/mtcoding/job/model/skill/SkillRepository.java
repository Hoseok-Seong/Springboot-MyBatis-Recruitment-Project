package shop.mtcoding.job.model.skill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SkillRepository {

    public List<Skill> findAll();

    public Skill findById(int id);

    public int insert(Skill skill);

    public int updateById(Skill skill);

    public int deleteById(int id);
}
