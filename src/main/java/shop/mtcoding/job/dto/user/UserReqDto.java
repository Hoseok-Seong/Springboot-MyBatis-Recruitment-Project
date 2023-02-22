package shop.mtcoding.job.dto.user;

import lombok.Getter;
import lombok.Setter;

public class UserReqDto {
    @Setter
    @Getter
    public static class LoginUserReqDto {
        private String username;
        private String password;
    }

    @Setter
    @Getter
    public static class LoginEnterpriseReqDto {
        private String enterpriseName;
        private String password;
    }

    @Setter
    @Getter
    public static class JoinUserReqDto {
        private String username;
        private String password;
        private String name;
        private String email;
        private String contact;
        private String profile;
    }

    @Setter
    @Getter
    public static class JoinEnterpriseReqDto {
        private String enterpriseName;
        private String password;
        private String address;
        private String contact;
        private String image;
        private String email;
        private String sector;
        private String size;
    }

}
