package shop.mtcoding.job.dto.enterprise;

import lombok.Getter;
import lombok.Setter;

public class EnterpriseReqDto {
    @Setter
    @Getter
    public static class LoginEnterpriseReqDto {
        private String enterpriseName;
        private String password;
        private String rememberEnt;
    }

    @Setter
    @Getter
    public static class JoinEnterpriseReqDto {
        private String enterpriseName;
        private String password;
        private String salt;
        private String address;
        private String contact;
        private String image;
        private String email;
        private String sector;
        private String size;
    }

    @Setter
    @Getter
    public static class UpdateEnterpriseReqDto {
        private String password;
        private String salt;
        private String address;
        private String contact;
        private String image;
        private String email;
        private String sector;
        private String size;
    }

}
