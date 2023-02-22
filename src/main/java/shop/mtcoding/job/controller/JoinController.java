package shop.mtcoding.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.model.enterprise.EnterpriseRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;

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
    public String join(JoinReqDto joinReqDto) {
        userRepository.insert(joinReqDto.getUsername(), joinReqDto.getPassword(), joinReqDto.getName(), joinReqDto.getEmail(), joinReqDto.getContact(), joinReqDto.getProfile());
        return "redirect:/";
    }

    @PostMapping("/enterprise/join")
    public String enterpriseJoin(JoinEnterpriseReqDto joinEnterpriseReqDto) {
        enterpriseRepository.insert(joinEnterpriseReqDto.toModel());
    return "redirect:/loginForm";
    }

    @Setter
    @Getter
    public static class JoinReqDto {
        private String username;
        private String password;
        private String name;
        private String email;
        private String contact;
        private String profile;
    }

    @Setter
    @Getter
    public class JoinUserReqDto {
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
        private String email;

        public Enterprise toModel() {
            Enterprise enterprise = new Enterprise();
            enterprise.setEnterpriseName(enterpriseName);
            enterprise.setPassword(password);
            enterprise.setAddress(address);
            enterprise.setContact(contact);
            enterprise.setEmail(email);
            return enterprise;
        }

    }
}