package shop.mtcoding.job.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import shop.mtcoding.job.dto.user.UserReqDto.JoinUserReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.LoginUserReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.UpdateUserReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;
import shop.mtcoding.job.model.userSkill.UserSkillRepository;
import shop.mtcoding.job.util.SaltEncoder;
import shop.mtcoding.job.util.Sha256Encoder;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserSkillRepository userSkillRepository;

    @Transactional(readOnly = true)
    public User 유저로그인하기(LoginUserReqDto loginUserReqDto) {
        try {
            String salt = userRepository.findSaltByUsername(loginUserReqDto.getUsername());
            if (salt == null) {
                throw new CustomApiException("아이디가 존재하지 않습니다");
            }
            String sha256Hash = Sha256Encoder.sha256(loginUserReqDto.getPassword() + salt);
            User principal = userRepository.findByUsernameAndPassword(loginUserReqDto.getUsername(),
                    sha256Hash);
            return principal;
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
        return null;
    }

    @Transactional
    public void 유저가입하기(JoinUserReqDto joinUserReqDto, @RequestParam("skill") List<Integer> skill) {
        // 1. 유저 유효성 검사
        User sameuser = userRepository.findByName(joinUserReqDto.getUsername());

        if (sameuser != null) {
            throw new CustomException("동일한 아이디가 존재합니다");
        }
        // 2. 암호화 후 db에 insert하기
        try {
            String salt = SaltEncoder.salt();
            String sha256Hash = Sha256Encoder.sha256(joinUserReqDto.getPassword() + salt);
            int result = userRepository.insert(joinUserReqDto.getUsername(), sha256Hash, salt,
                    joinUserReqDto.getName(), joinUserReqDto.getEmail(), joinUserReqDto.getContact());
            if (result != 1) {
                throw new CustomException("회원가입이 실패하였습니다");
            }
            joinUserReqDto.setId(userRepository.findByName(joinUserReqDto.getUsername()).getId()); // id 할당
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
        // 3. skill에 대한 처리
        if (skill != null) { // skill이 0이 아닌 경우에만 처리
            try {
                for (Integer checkSkill : skill) {
                    int result = userSkillRepository.insert(joinUserReqDto.getId(), checkSkill);
                    if (result != 1) {
                        throw new CustomException("실패");
                    }
                }
            } catch (Exception e) {
                throw new CustomException("skill insert 실패");
            }
        }
    }

    @Transactional
    public void 유저회원정보수정하기(UpdateUserReqDto updateUserReqDto, int id, @RequestParam List<Integer> skill) {

        try {
            String salt = SaltEncoder.salt();
            String sha256Hash = Sha256Encoder.sha256(updateUserReqDto.getPassword() + salt);
            int result = userRepository.updateById(id,
                    sha256Hash, salt,
                    updateUserReqDto.getEmail(),
                    updateUserReqDto.getContact());
            if (result != 1) {
                throw new CustomApiException("회원정보수정이 실패하였습니다");
            }
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
        userSkillRepository.deleteByUserId(id);
        try {
            for (Integer checkSkill : skill) {
                int result = userSkillRepository.insert(id, checkSkill);
                if (result != 1) {
                    throw new CustomException("실패");
                }
            }
        } catch (Exception e) {
            throw new CustomException("skill insert 실패");
        }
    }
}