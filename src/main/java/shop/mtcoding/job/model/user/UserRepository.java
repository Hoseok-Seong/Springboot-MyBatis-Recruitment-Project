package shop.mtcoding.job.model.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRepository {
        public List<User> findAll();

        public User findById(int id);

        public int insert(@Param("username") String username, @Param("password") String password,
                        @Param("name") String name,
                        @Param("email") String email, @Param("contact") String contact,
                        @Param("profile") String profile);

        public int updateById(User user);

        public int deleteById(int id);

        public User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

        public String findSaltById(int id);

        public User findByName(String username);

}
