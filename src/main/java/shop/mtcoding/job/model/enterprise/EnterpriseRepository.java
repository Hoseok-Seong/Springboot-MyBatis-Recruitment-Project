package shop.mtcoding.job.model.enterprise;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EnterpriseRepository {
        public List<Enterprise> findAll();

        public Enterprise findById(int id);

        public int insert(@Param("enterpriseName") String enterpriseName, @Param("password") String password,
                        @Param("salt") String salt,
                        @Param("address") String address,
                        @Param("contact") String contact,
                        @Param("email") String email, @Param("size") String size,
                        @Param("sector") String sector);

        public int updateById(@Param("id") int id,
                        @Param("password") String password,
                        @Param("salt") String salt,
                        @Param("address") String address,
                        @Param("contact") String contact,
                        @Param("email") String email, @Param("size") String size,
                        @Param("sector") String sector);

        public int deleteById(int id);

        public String findSaltByEnterprisename(String enterpriseName);

        public Enterprise findByName(String enterpriseName);

        public Enterprise findByEnterprisenameAndPassword(@Param("enterpriseName") String enterpriseName,
                        @Param("password") String password);

        public Enterprise findByUserId(int id);
}
