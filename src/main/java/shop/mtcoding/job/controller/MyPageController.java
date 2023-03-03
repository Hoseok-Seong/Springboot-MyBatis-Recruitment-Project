package shop.mtcoding.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {
    @GetMapping("/mypage")
    public String mypage(Model model) {
        return "mypage/mypage";
    }
}
