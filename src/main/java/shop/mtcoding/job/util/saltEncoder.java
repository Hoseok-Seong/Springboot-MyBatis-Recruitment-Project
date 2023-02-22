package shop.mtcoding.job.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class saltEncoder {
    public static String salt(String input) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); // BCryptPasswordEncoder 인스턴스 생성
        String saltPassword = passwordEncoder.encode(input); // 비밀번호를 암호화
        return saltPassword;
    }
}