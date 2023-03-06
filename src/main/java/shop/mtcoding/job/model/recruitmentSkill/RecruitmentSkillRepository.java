package shop.mtcoding.job.model.recruitmentSkill;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostSkillRespDto;
import shop.mtcoding.job.dto.recruitmentSkill.EnterpriseMatchingDto;

@Mapper
public interface RecruitmentSkillRepository {

    public List<RecruitmentSkill> findAll();

    public RecruitmentSkill findById(int id);

    public List<RecruitmentPostSkillRespDto> findByRecruitmentId(int recruitmentId);

    public int insert(@Param("recruitmentId") int recruitmentId, @Param("skill") Integer skill);

    public int updateById(RecruitmentSkill skill);

    public int deleteById(int id);

    public int deleteByRecruitmentId(int recruitmentId);

    public List<EnterpriseMatchingDto> enterpriseMatching(int id);
}