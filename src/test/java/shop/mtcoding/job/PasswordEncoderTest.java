package shop.mtcoding.job;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordEncoderTest {
    @Test
    public void salt_test() {
        String input = "5thProject";
        PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        String saltPassword = passwordEncoder.encode(input);
        System.out.println("테스트 : " + saltPassword);

    }
}
