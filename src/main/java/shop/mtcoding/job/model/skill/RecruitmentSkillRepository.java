package shop.mtcoding.job.model.skill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostSkillRespDto;

@Mapper
public interface RecruitmentSkillRepository {

    public List<RecruitmentSkill> findAll();

    public RecruitmentSkill findById(int id);

    public List<RecruitmentPostSkillRespDto> findByRecruitmentId(int recruitmentId);

    public int insert(@Param("recruitmentId") int recruitmentId, @Param("skill") String skill);

    public int updateById(RecruitmentSkill skill);

    public int deleteById(int id);
}