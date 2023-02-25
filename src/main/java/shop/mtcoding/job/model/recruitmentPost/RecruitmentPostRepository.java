package shop.mtcoding.job.model.recruitmentPost;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.job.dto.recruitment.RecruitmentPostRespDto.RecruitmentPostDetailRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.PostRespDto;;

@Mapper
public interface RecruitmentPostRepository {
        public List<RecruitmentPost> findAll();

        public RecruitmentPost findById(int id);

        public RecruitmentPostDetailRespDto findByIdWithEnterpriseId(int id);

        public int insert(RecruitmentPost recruitmentPost);

        public int insertWithEnterpriseName(RecruitmentPost recruitmentPost);

        public int updateById(RecruitmentPost recruitmentPost);

        public int deleteById(int id);

        public List<PostRespDto> findByPost();
}
