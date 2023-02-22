package shop.mtcoding.job.model.enterprise;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EnterpriseRepository {
        public List<Enterprise> findAll();

        public Enterprise findById(int id);

        public int insert(@Param("enterpriseName") String enterpriseName, @Param("password") String password,
        @Param("address") String address, @Param("contact") String contact, @Param("image") String image,
        @Param("email") String email, @Param("sector") String sector, @Param("size") String size);

        public int updateById(Enterprise enterprise);

        public int deleteById(int id);
}
