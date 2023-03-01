package shop.mtcoding.job.model.applyResume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ApplyResumeRepository {
    public int insert(@Param("recruitmentPostId") int recruitmentPostId, @Param("userId") int userId,
            @Param("title") String title,
            @Param("content") String content,
            @Param("career") String career,
            @Param("education") String education, @Param("skill") String skill,
            @Param("award") String award, @Param("language") String language,
            @Param("link") String link,
            @Param("file") String file,
            @Param("birthdate") String birthdate, @Param("address") String address,
            @Param("finish") boolean finish);

    public List<ApplyResume> findByUserId(int UserId);
}
