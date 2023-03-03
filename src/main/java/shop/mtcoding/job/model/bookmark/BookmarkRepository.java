package shop.mtcoding.job.model.bookmark;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BookmarkRepository {
        public List<Bookmark> findAll();

        public Bookmark findById(int id);

        public int insert(@Param("userId") int userId, @Param("enterpriseId") int enterpriseId);

        public int updateById(Bookmark bookmark);

        public int deleteById(int id);

        public Bookmark findByEnterpriseIdAndUserId(@Param("enterpriseId") int enterpriseId, @Param("userId") int userId);

        public List<Bookmark> findByBoardId(int enterpriseId);
}
