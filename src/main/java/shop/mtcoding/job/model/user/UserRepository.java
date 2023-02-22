package shop.mtcoding.job.model.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
        public List<User> findAll();

        public User findById(int id);

        public int insert(User user);

        public int updateById(User user);

        public int deleteById(int id);
}
