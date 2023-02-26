package shop.mtcoding.job.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.dto.user.UserReqDto.JoinUserReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.LoginUserReqDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.service.UserService;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "login/loginForm";
    }

    @PostMapping("/user/login")
    public String userLogin(LoginUserReqDto loginUserReqDto) {
        if (loginUserReqDto.getUsername() == null || loginUserReqDto.getUsername().isEmpty()) {
            throw new CustomException("아이디를 작성해주세요");
        }
        if (loginUserReqDto.getPassword() == null || loginUserReqDto.getPassword().isEmpty()) {
            throw new CustomException("비밀번호를 작성해주세요");
        }
        // 1. 로그인하기 service
        User principal = userService.유저로그인하기(loginUserReqDto);

        // 2. session에 저장
        session.setAttribute("principal", principal);

        // 3. principal 유효성 검사
        if (session.getAttribute("principal") == null) {
            throw new CustomException("존재하지 않는 아이디거나 비밀번호를 다시 확인해주시기 바랍니다");
        }

        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/joinForm")
    public String joinForm() {
        return "join/joinForm";
    }

    @PostMapping("/user/join")
    public String userJoin(JoinUserReqDto joinUserReqDto) {
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

        userService.유저가입하기(joinUserReqDto);

        return "redirect:/loginForm";
    }

    @GetMapping("/user/usernameSameCheck")
    public @ResponseBody ResponseDto<?> check(String username) {
        if (username == null || username.isEmpty()) {
            return new ResponseDto<>(-1, "username 쿼리스트링을 전달해주세요..", null);
        }
        if (username.equals("ssar")) { // db에 있음
            return new ResponseDto<>(1, "동일한 username이 존재합니다.", false);
        } else {
            return new ResponseDto<>(1, "해당 username으로 회원가입이 가능합니다.", true);
        }
    }
}
