package shop.mtcoding.job.model.recruitmentPost;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostCategoryRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostDetailRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostListRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostSearchRespDto;;

@Mapper
public interface RecruitmentPostRepository {
        public List<RecruitmentPost> findAll();

        public RecruitmentPost findById(int id);

        public RecruitmentPost findByEnterpriseLogo(String enterpriseLogo);

        public RecruitmentPostDetailRespDto findByIdWithEnterpriseId(int id);

        public int insert(RecruitmentPost recruitmentPost);

        public int updateById(RecruitmentPost recruitmentPost);

        public int deleteById(int id);

        public List<RecruitmentPostListRespDto> findByPost();

        public List<RecruitmentPostSearchRespDto> findByTitleOrContent(
                        RecruitmentPostSearchRespDto recruitmentPostSearchRespDto);

        public List<RecruitmentPostCategoryRespDto> findByCategory(
                        RecruitmentPostCategoryRespDto recruitmentPostCategoryRespDto);
}
