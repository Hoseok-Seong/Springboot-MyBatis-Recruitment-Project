package shop.mtcoding.job.util;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

public class SaltEncoder {
    public static String salt() {
        String input = "5thProject";
        PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        String saltPassword = passwordEncoder.encode(input);
        return saltPassword;
    }
}