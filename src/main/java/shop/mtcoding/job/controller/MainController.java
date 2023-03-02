package shop.mtcoding.job.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.job.dto.user.UserMatchingDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;

@Controller
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HttpSession session;

    @GetMapping({ "/", "/main" })
    public String main(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            UserMatchingDto userMatchingDto = userRepository.userMatching(principal.getId());
            model.addAttribute("userMatching", userMatchingDto);
        }
        return "/main/main";
    }
}