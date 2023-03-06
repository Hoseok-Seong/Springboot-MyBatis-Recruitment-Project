package shop.mtcoding.job.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.job.dto.user.UserMatchingDto;
import shop.mtcoding.job.model.skill.UserSkillRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;

@Controller
public class MainController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserSkillRepository userSkillRepository;

    @Autowired
    private HttpSession session;

    @GetMapping({ "/", "/main" })
    public String main(Model model) {
        User principal = (User) session.getAttribute("principal");
        // Map<Integer, String> skillMap = new HashMap<>();
        // skillMap.put(1, "Java");
        // skillMap.put(2, "HTML");
        // skillMap.put(3, "JavaScript");
        // skillMap.put(4, "VueJS");
        // skillMap.put(5, "CSS");
        // skillMap.put(6, "Node.js");
        // skillMap.put(7, "React");
        // skillMap.put(8, "ReactJS");
        // skillMap.put(9, "Typescript");
        // skillMap.put(10, "Zustand");
        // skillMap.put(11, "AWS");
        // model.addAttribute("userSkillMap", skillMap);
        // model.addAttribute("userSkillDtos",
        // userSkillRepository.findByUserId(principal.getId()));
        // if(principal!=null)
        // {
        // List<UserMatchingDto> userMatchingDto =
        // userRepository.userMatching(principal.getId());
        // model.addAttribute("userMatching", userMatchingDto);
        // }
        return "/main/main";
    }
}