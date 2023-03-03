package shop.mtcoding.job.model.bookmark;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookmarkRepository {
        public List<Bookmark> findAll();

        public Bookmark findById(int id);

        public int insert(Bookmark bookmark);

        public int updateById(Bookmark bookmark);

        public int deleteById(int id);

        public Bookmark findByBoardIdAndUserId(Bookmark bookmark);

        public List<Bookmark> findByBoardId(int enterpriseId);
}
