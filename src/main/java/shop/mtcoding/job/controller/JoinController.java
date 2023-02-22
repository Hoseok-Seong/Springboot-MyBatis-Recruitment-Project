package shop.mtcoding.job.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.model.enterprise.EnterpriseRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;
import shop.mtcoding.job.util.HashEncoding;

@Controller
public class JoinController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EnterpriseRepository enterpriseRepository;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "join/aaa";
    }

    @GetMapping("/joinForm")
    public String joinForm() {
        return "main/joinForm";
    }

    @PostMapping("/join")
    public String join(JoinUserReqDto joinUserReqDto) {
        if (joinUserReqDto.getUsername() == null || joinUserReqDto.getUsername().isEmpty()) {
            throw new CustomException("username을 작성해주세요");
        }
        if (joinUserReqDto.getPassword() == null || joinUserReqDto.getPassword().isEmpty()) {
            throw new CustomException("password를 작성해주세요");
        }
        if (joinUserReqDto.getName() == null || joinUserReqDto.getName().isEmpty()) {
            throw new CustomException("name을 작성해주세요");
        }
        if (joinUserReqDto.getEmail() == null || joinUserReqDto.getEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }
        if (joinUserReqDto.getContact() == null || joinUserReqDto.getContact().isEmpty()) {
            throw new CustomException("전화번호를 입력해주세요");
        }
        try {
            String sha256Hash = HashEncoding.sha256(joinUserReqDto.getPassword());
            userRepository.insert(joinUserReqDto.getUsername(), sha256Hash, joinUserReqDto.getName(), 
            joinUserReqDto.getEmail(), joinUserReqDto.getContact());
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
        
        return "redirect:/";
    }

    @PostMapping("/enterprise/join")
    public String enterpriseJoin(JoinEnterpriseReqDto joinEnterpriseReqDto) {
        
        if (joinEnterpriseReqDto.getEnterpriseName() == null || joinEnterpriseReqDto.getEnterpriseName().isEmpty()) {
            throw new CustomException("enterprisename을 작성해주세요");
        }
        if (joinEnterpriseReqDto.getPassword() == null || joinEnterpriseReqDto.getPassword().isEmpty()) {
            throw new CustomException("password를 작성해주세요");
        }
        if (joinEnterpriseReqDto.getAddress() == null || joinEnterpriseReqDto.getAddress().isEmpty()) {
            throw new CustomException("address를 작성해주세요");
        }
        if (joinEnterpriseReqDto.getEmail() == null || joinEnterpriseReqDto.getEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }
        if (joinEnterpriseReqDto.getContact() == null || joinEnterpriseReqDto.getContact().isEmpty()) {
            throw new CustomException("전화번호를 입력해주세요");
        }
        if (joinEnterpriseReqDto.getSector() == null || joinEnterpriseReqDto.getSector().isEmpty()) {
            throw new CustomException("sector을 작성해주세요");
        }
        if (joinEnterpriseReqDto.getSize() == null || joinEnterpriseReqDto.getSize().isEmpty()) {
            throw new CustomException("size을 작성해주세요");
        }
        try {
            String sha256Hash = HashEncoding.sha256(joinEnterpriseReqDto.getPassword());
            
            // enterpriseRepository.insert(joinEnterpriseReqDto.toModel(sha256Hash));
            enterpriseRepository.insert(joinEnterpriseReqDto.getEnterpriseName(), sha256Hash, joinEnterpriseReqDto.getAddress(),
            joinEnterpriseReqDto.getContact(), joinEnterpriseReqDto.getImage(), joinEnterpriseReqDto.getEmail(), joinEnterpriseReqDto.getSector(), 
            joinEnterpriseReqDto.getSize());
        } catch (NoSuchAlgorithmException e) {
            System.err.println("알고리즘을 찾을 수 없습니다: " + e.getMessage());
        }
    return "redirect:/loginForm";
    }

    @Setter
    @Getter
    public static class JoinUserReqDto {
        private String username;
        private String password;
        private String name;
        private String email;
        private String contact;

        public User toModel() {
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setName(name);
            user.setEmail(email);
            user.setContact(contact);
            return user;
        }

    }

    @Setter
    @Getter
    public static class JoinEnterpriseReqDto {
        private String enterpriseName;
        private String password;
        private String address;
        private String contact;
        private String image;
        private String email;
        private String sector;
        private String size;

        public Enterprise toModel(String sha256Hash) {
            Enterprise enterprise = new Enterprise();
            enterprise.setEnterpriseName(enterpriseName);
            enterprise.setPassword(sha256Hash);
            enterprise.setAddress(address);
            enterprise.setContact(contact);
            enterprise.setImage(image);
            enterprise.setEmail(email);
            enterprise.setSector(sector);
            enterprise.setSize(size);
            return enterprise;
        }

    }
}