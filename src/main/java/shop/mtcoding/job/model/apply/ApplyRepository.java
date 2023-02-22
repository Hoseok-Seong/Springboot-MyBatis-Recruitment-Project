package shop.mtcoding.job.model.apply;

import java.util.List;

public interface ApplyRepository {
        public List<Apply> findAll();

        public Apply findById(int id);

        public int insert(Apply apply);

        public int updateById(Apply apply);

        public int deleteById(int id);
}
