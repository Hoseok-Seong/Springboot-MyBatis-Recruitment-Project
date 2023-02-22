package shop.mtcoding.job.model.like;

import java.util.List;

public interface LikeRepository {
        public List<Like> findAll();

        public Like findById(int id);

        public int insert(Like like);

        public int updateById(Like like);

        public int deleteById(int id);
}
