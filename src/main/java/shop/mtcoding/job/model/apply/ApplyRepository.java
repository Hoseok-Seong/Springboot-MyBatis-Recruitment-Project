package shop.mtcoding.job.model.apply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ApplyRepository {
        public List<Apply> findAll();

        public Apply findById(int id);

        public int insert(@Param("userId") int userId, @Param("enterpriseId") int enterpriseId,
                        @Param("recruitmentPostId") int recruitmentPostId,
                        @Param("sector") String sector, @Param("resumeId") int resumeId);

        public int updateById(Apply apply);

        public int deleteById(int id);

        public Apply findByUserIdWithRecruitmentPostId(@Param("userId") int userId,
                        @Param("recruitmentPostId") int recruitmentPostId);

        public int deleteByUserIdWithRecruitmentPostId(@Param("userId") int userId,
                        @Param("recruitmentPostId") int recruitmentPostId);
}
