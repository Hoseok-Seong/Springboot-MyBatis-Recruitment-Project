package shop.mtcoding.job.model.bookmark;

import java.util.List;

public interface BookmarkRepository {
        public List<Bookmark> findAll();

        public Bookmark findById(int id);

        public int insert(Bookmark bookmark);

        public int updateById(Bookmark bookmark);

        public int deleteById(int id);
}
