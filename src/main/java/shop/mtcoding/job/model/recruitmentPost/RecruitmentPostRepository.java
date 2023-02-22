package shop.mtcoding.job.model.recruitmentPost;

import java.util.List;

public interface RecruitmentPostRepository {
        public List<RecruitmentPost> findAll();

        public RecruitmentPost findById(int id);

        public int insert(RecruitmentPost recruitmentPost);

        public int updateById(RecruitmentPost recruitmentPost);

        public int deleteById(int id);
}
