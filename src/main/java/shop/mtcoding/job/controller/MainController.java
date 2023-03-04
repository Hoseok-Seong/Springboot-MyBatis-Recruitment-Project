package shop.mtcoding.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostListRespDto;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;

@Controller
public class MainController {

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @GetMapping({ "/", "/main" })
    public String main(Model model) {
        List<RecruitmentPostListRespDto> posts = recruitmentPostRepository.findByPost();
        // d-day 계산
        for (RecruitmentPostListRespDto post : posts) {
            post.calculateDiffDays(); // D-Day 계산
        }
        model.addAttribute("Posts", posts);
        return "/main/main";
    }
}