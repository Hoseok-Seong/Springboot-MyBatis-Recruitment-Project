package shop.mtcoding.job.model.enterprise;

import java.util.List;

public interface EnterpriseRepository {
        public List<Enterprise> findAll();

        public Enterprise findById(int id);

        public int insert(Enterprise enterprise);

        public int updateById(Enterprise enterprise);

        public int deleteById(int id);
}
