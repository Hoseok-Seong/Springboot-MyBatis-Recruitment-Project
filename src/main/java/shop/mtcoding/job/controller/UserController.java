package shop.mtcoding.job.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.dto.user.UserReqDto.JoinUserReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.LoginUserReqDto;
import shop.mtcoding.job.dto.user.UserReqDto.UpdateUserReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;
import shop.mtcoding.job.service.UserService;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "login/loginForm";
    }

    @PostMapping("/user/login")
    public @ResponseBody ResponseEntity<?> userLogin(
            @RequestBody LoginUserReqDto loginUserReqDto, String remember, HttpServletResponse response) {
        if (loginUserReqDto.getUsername() == null || loginUserReqDto.getUsername().isEmpty()) {
            throw new CustomApiException("아이디를 작성해주세요");
        }
        if (loginUserReqDto.getPassword() == null || loginUserReqDto.getPassword().isEmpty()) {
            throw new CustomApiException("비밀번호를 작성해주세요");
        }
        // 1. 로그인하기 service
        User principal = userService.유저로그인하기(loginUserReqDto);

        // 2. session에 저장
        session.setAttribute("principal", principal);

        // 3. principal 유효성 검사
        if (session.getAttribute("principal") == null) {
            throw new CustomApiException("존재하지 않는 아이디거나 비밀번호를 다시 확인해주시기 바랍니다");
        }

        // 4. 아이디 기억
        if (loginUserReqDto.getRemember().equals("true")) {
            Cookie cookie = new Cookie("remember", loginUserReqDto.getUsername());
            cookie.setPath("/");
            cookie.setMaxAge(600);
            response.addCookie(cookie);
        }

        if (loginUserReqDto.getRemember().equals("false")) {
            Cookie cookie = new Cookie("remember", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        return new ResponseEntity<>(new ResponseDto<>(1, "로그인 성공", null), HttpStatus.CREATED);
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
    public String userJoin(JoinUserReqDto joinUserReqDto, @RequestParam(required = false) List<Integer> skill) {
        if (joinUserReqDto.getUsername() == null || joinUserReqDto.getUsername().isEmpty()) {
            throw new CustomException("아이디를 작성해주세요");
        }
        if (joinUserReqDto.getPassword() == null || joinUserReqDto.getPassword().isEmpty()) {
            throw new CustomException("비밀번호를 작성해주세요");
        }
        if (joinUserReqDto.getName() == null || joinUserReqDto.getName().isEmpty()) {
            throw new CustomException("이름을 작성해주세요");
        }
        if (joinUserReqDto.getEmail() == null || joinUserReqDto.getEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }
        if (joinUserReqDto.getContact() == null || joinUserReqDto.getContact().isEmpty()) {
            throw new CustomException("전화번호를 입력해주세요");
        }

        userService.유저가입하기(joinUserReqDto, skill);

        return "redirect:/";
    }

    @GetMapping("/user/usernameSameCheck")
    public @ResponseBody ResponseDto<?> check(String username, JoinUserReqDto joinUserReqDto) {
        if (username == null || username.isEmpty()) {
            return new ResponseDto<>(-1, "아이디가 입력되지 않았습니다.", null);
        }
        User sameuser = userRepository.findByName(joinUserReqDto.getUsername());
        if (sameuser != null) {
            return new ResponseDto<>(1, "동일한 아이디가 존재합니다.", false);
        } else {
            return new ResponseDto<>(1, "해당 아이디로 회원가입이 가능합니다.", true);
        }
    }

    @GetMapping("/updateForm")
    public String updateForm() {
        return "user/updateForm";
    }

    @PostMapping("/user/update")
    public String userUpdate(UpdateUserReqDto updateUserReqDto, @RequestParam("skill") List<Integer> skill) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("회원 인증이 되지 않았습니다. 로그인을 해주세요.", HttpStatus.UNAUTHORIZED);
        }

        if (updateUserReqDto.getPassword() == null || updateUserReqDto.getPassword().isEmpty()) {
            throw new CustomException("비밀번호를 작성해주세요");
        }
        if (updateUserReqDto.getEmail() == null || updateUserReqDto.getEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }
        if (updateUserReqDto.getContact() == null || updateUserReqDto.getContact().isEmpty()) {
            throw new CustomException("전화번호를 입력해주세요");
        }

        userService.유저회원정보수정하기(updateUserReqDto, principal.getId(), skill);
        session.invalidate();

        return "redirect:/";
    }
}