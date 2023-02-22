package shop.mtcoding.job.service;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.user.UserReqDto.JoinEnterpriseReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.LoginEnterpriseReqDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.enterprise.EnterpriseRepository;
import shop.mtcoding.job.model.user.User;

@Service
public class EnterpriseService {

    @Autowired
    private EnterpriseRepository enterpriseRepository;

    @Transactional(readOnly = true)
    public User 기업로그인하기(LoginEnterpriseReqDto loginEnterpriseReqDto) {
        try {
            String sha256Hash = sha256Encoder.sha256(loginUserReqDto.getPassword());
            String salt = saltEncoder.salt();
            User principal = userRepository.findByUsernameAndPassword(loginUserReqDto.getUsername(),
                    sha256Hash + "_" + salt);
            return principal;
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
        return null;
    }

    @Transactional
    public void 기업가입하기(JoinEnterpriseReqDto joinEnterpriseReqDto) {
        // 1. 유저 유효성 검사
        User sameuser = userRepository.findByName(joinEnterpriseReqDto.getUsername());

        if (sameuser != null) {
            throw new CustomException("동일한 아이디가 존재합니다");
        }
        // 1. db에 insert하기
        int result = userRepository.insert(joinReqDto.getUsername(), joinReqDto.getPassword(), joinReqDto.getEmail());

        if (result != 1) {
            throw new CustomException("회원가입이 실패하였습니다");
        }
    }

}
