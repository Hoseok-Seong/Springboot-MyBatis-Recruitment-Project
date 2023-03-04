package shop.mtcoding.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostListRespDto;
import shop.mtcoding.job.dto.userSkill.UserMatchingDto;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;

@Controller
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Autowired
    private HttpSession session;

    @GetMapping({ "/", "/main" })
    public String main(Model model) {
        User principal = (User) session.getAttribute("principal");

        List<RecruitmentPostListRespDto> posts = recruitmentPostRepository.findByPost();
        // d-day 계산
        for (RecruitmentPostListRespDto post : posts) {
            post.calculateDiffDays(); // D-Day 계산
        }

        model.addAttribute("Posts", posts);
        return "/main/main";
    }
}