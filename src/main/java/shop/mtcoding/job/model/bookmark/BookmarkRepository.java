package shop.mtcoding.job.model.bookmark;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.job.dto.bookmark.BookmarkEntReqDto;
import shop.mtcoding.job.dto.bookmark.BookmarkReqDto;

@Mapper
public interface BookmarkRepository {
        public List<Bookmark> findAll();

        public Bookmark findById(int id);

        public int insert(Bookmark bookmark);

        public int updateById(Bookmark bookmark);

        public int deleteById(int id);

        public Bookmark findByRecruitmentIdAndUserId(@Param("recruitmentId") int recruitmentId,
                        @Param("userId") int userId);

        public List<BookmarkReqDto> findByUserId(@Param("userId") int userId);

        public List<BookmarkEntReqDto> findByEnterpriseId(@Param("recruitmentId") int recruitmentId);
}
