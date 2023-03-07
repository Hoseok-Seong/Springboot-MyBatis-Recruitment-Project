package shop.mtcoding.job.dto.user;

import lombok.Getter;
import lombok.Setter;

public class UserReqDto {
    @Setter
    @Getter
    public static class LoginUserReqDto {
        private String username;
        private String password;
        private String remember;
    }

    @Setter
    @Getter
    public static class JoinUserReqDto {
        private int id;
        private String username;
        private String password;
        private String salt;
        private String name;
        private String email;
        private String contact;
    }

    @Setter
    @Getter
    public static class UpdateUserReqDto {
        private String password;
        private String email;
        private String contact;
        private String salt;
    }
}
