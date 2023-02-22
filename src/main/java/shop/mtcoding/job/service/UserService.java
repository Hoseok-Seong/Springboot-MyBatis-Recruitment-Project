package shop.mtcoding.job.service;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.user.UserReqDto.JoinUserReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.LoginUserReqDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;
import shop.mtcoding.job.util.saltEncoder;
import shop.mtcoding.job.util.sha256Encoder;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Transactional(readOnly = true)
    public User 유저로그인하기(LoginUserReqDto loginUserReqDto) {
        try {
            String salt = userRepository.findSaltByUsername(loginUserReqDto.getUsername());
            if (salt == null) {
                throw new CustomException("아이디가 존재하지 않습니다");
            }
            String sha256Hash = sha256Encoder.sha256(loginUserReqDto.getPassword());
            User principal = userRepository.findByUsernameAndPassword(loginUserReqDto.getUsername(),
                    sha256Hash + "_" + salt);
            return principal;
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
        return null;
    }

    @Transactional
    public void 유저가입하기(JoinUserReqDto joinUserReqDto) {
        // 1. 유저 유효성 검사
        User sameuser = userRepository.findByName(joinUserReqDto.getUsername());

        if (sameuser != null) {
            throw new CustomException("동일한 아이디가 존재합니다");
        }
        // 2. 암호화 후 db에 insert하기
        try {
            String sha256Hash = sha256Encoder.sha256(joinUserReqDto.getPassword());
            String salt = saltEncoder.salt();
            int result = userRepository.insert(joinUserReqDto.getUsername(), sha256Hash + "_" + salt, salt,
                    joinUserReqDto.getName(), joinUserReqDto.getEmail(), joinUserReqDto.getContact(),
                    joinUserReqDto.getProfile());
            if (result != 1) {
                throw new CustomException("회원가입이 실패하였습니다");
            }
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
    }
}
