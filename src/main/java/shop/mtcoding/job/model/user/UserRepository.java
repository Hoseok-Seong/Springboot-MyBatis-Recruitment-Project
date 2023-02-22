package shop.mtcoding.job.model.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRepository {
        public List<User> findAll();

        public User findById(int id);

        public int insert(User user);

        public int updateById(User user);

        public int deleteById(int id);

        public User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
}
