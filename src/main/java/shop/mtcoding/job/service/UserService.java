package shop.mtcoding.job.service;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.user.UserReqDto.JoinEnterpriseReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.JoinUserReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.LoginEnterpriseReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.LoginUserReqDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.enterprise.EnterpriseRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;
import shop.mtcoding.job.util.HashEncoding;
import shop.mtcoding.job.util.saltEncoder;
import shop.mtcoding.job.util.sha256Encoder;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EnterpriseRepository enterpriseRepository;

    @Transactional(readOnly = true)
    public User 유저로그인하기(LoginUserReqDto loginUserReqDto) {
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
    public void 유저가입하기(JoinUserReqDto joinUserReqDto) {
        // 1. 유저 유효성 검사
        User sameuser = userRepository.findByName(joinReqDto.getUsername());

        if (sameuser != null) {
            throw new CustomException("동일한 아이디가 존재합니다");
        }
        // 1. db에 insert하기
        int result = userRepository.insert(joinReqDto.getUsername(), joinReqDto.getPassword(), joinReqDto.getEmail());

        if (result != 1) {
            throw new CustomException("회원가입이 실패하였습니다");
        }
    }

    @Transactional
    public void 기업가입하기(JoinEnterpriseReqDto joinEnterpriseReqDto) {
        // 1. 유저 유효성 검사
        User sameuser = userRepository.findByName(joinReqDto.getUsername());

        if (sameuser != null) {
            throw new CustomException("동일한 아이디가 존재합니다");
        }
        // 1. db에 insert하기
        int result = userRepository.insert(joinReqDto.getUsername(), joinReqDto.getPassword(), joinReqDto.getEmail());

        if (result != 1) {
            throw new CustomException("회원가입이 실패하였습니다");
        }
    }

    try

    {
        String sha256Hash = HashEncoding.sha256(joinUserReqDto.getPassword());
        userRepository.insert(joinUserReqDto.getUsername(), sha256Hash, joinUserReqDto.getName(),
                joinUserReqDto.getEmail(), joinUserReqDto.getContact());
    }catch(
    NoSuchAlgorithmException e)
    {
        System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
    }

    try
    {
        String sha256Hash = HashEncoding.sha256(joinEnterpriseReqDto.getPassword());

        // enterpriseRepository.insert(joinEnterpriseReqDto.toModel(sha256Hash));
        enterpriseRepository.insert(joinEnterpriseReqDto.getEnterpriseName(), sha256Hash,
                joinEnterpriseReqDto.getAddress(),
                joinEnterpriseReqDto.getContact(), joinEnterpriseReqDto.getImage(), joinEnterpriseReqDto.getEmail(),
                joinEnterpriseReqDto.getSector(),
                joinEnterpriseReqDto.getSize());
    }catch(
    NoSuchAlgorithmException e)
    {
        System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
    }
}
