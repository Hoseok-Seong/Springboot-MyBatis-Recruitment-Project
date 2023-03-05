package shop.mtcoding.job.model.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRepository {
        public List<User> findAll();

        public User findById(int id);

        public int insert(@Param("username") String username, @Param("password") String password,
                        @Param("salt") String salt,
                        @Param("name") String name,
                        @Param("email") String email, @Param("contact") String contact);

        public int updateById(@Param("id") int id, @Param("password") String password,
                        @Param("salt") String salt,
                        @Param("email") String email, @Param("contact") String contact);

        public int deleteById(int id);

        public User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

        public String findSaltByUsername(String username);

        public User findByName(String username);

        public User findByUsername(String username);

}
