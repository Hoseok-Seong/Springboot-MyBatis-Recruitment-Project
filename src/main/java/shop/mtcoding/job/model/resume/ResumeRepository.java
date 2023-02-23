package shop.mtcoding.job.model.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ResumeRepository {
        public List<Resume> findAll();

        public Resume findById(int id);

        public int insert(@Param("userId") int userId, @Param("title") String title,
                        @Param("content") String content,
                        @Param("career") String career,
                        @Param("education") String education, @Param("skill") String skill,
                        @Param("award") String award, @Param("language") String language,
                        @Param("link") String link,
                        @Param("file") String file,
                        @Param("birthdate") String birthdate, @Param("address") String address);

        public int updateById(Resume resume);

        public int deleteById(int id);
}
