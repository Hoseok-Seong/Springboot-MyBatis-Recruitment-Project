package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.user.UserReqDto.LoginReqDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;

@Service
public class LoginService {
    @Autowired
    private UserRepository userRepository;

    @Transactional(readOnly = true)
    public User 로그인하기(LoginReqDto loginReqDto) {
        // 1. db에 select하기
        User principal = userRepository.findByUsernameAndPassword(loginReqDto.getUsername(), loginReqDto.getPassword());

        // 2. principal 유효성 검사
        if (principal == null) {
            throw new CustomException("존재하지 않는 아이디거나 비밀번호를 다시 확인해주시기 바랍니다");
        }

        return principal;
    }
}
