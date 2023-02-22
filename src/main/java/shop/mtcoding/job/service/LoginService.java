package shop.mtcoding.job.service;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.user.UserReqDto.LoginReqDto;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;
import shop.mtcoding.job.util.saltEncoder;
import shop.mtcoding.job.util.sha256Encoder;

@Service
public class LoginService {
    @Autowired
    private UserRepository userRepository;

    @Transactional(readOnly = true)
    public User 로그인하기(LoginReqDto loginReqDto) {
        try {
            String sha256Hash = sha256Encoder.sha256(loginReqDto.getPassword());
            String salt = saltEncoder.salt(loginReqDto.getPassword());
            User principal = userRepository.findByUsernameAndPassword(loginReqDto.getUsername(),
                    sha256Hash + "_" + salt);
            return principal;
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
        return null;
    }
}
