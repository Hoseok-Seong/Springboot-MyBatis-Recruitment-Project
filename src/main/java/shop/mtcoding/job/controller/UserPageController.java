package shop.mtcoding.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForUserRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostListRespDto;
import shop.mtcoding.job.dto.user.UserMatchingDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.apply.ApplyRepository;
import shop.mtcoding.job.model.applyResume.ApplyResume;
import shop.mtcoding.job.model.applyResume.ApplyResumeRepository;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;

@Controller
public class UserPageController {
    @Autowired
    private HttpSession session;

    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private ApplyResumeRepository applyResumeRepository;

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/myapply")
    public String mypage(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("회원 인증이 되지 않았습니다. 로그인을 해주세요.", HttpStatus.UNAUTHORIZED);
        }

        List<ApplyListForUserRespDto> applyList = applyRepository.findByUserId(
                principal.getId());
        model.addAttribute("applyLists", applyList);

        List<ApplyResume> resumeList = applyResumeRepository.findByUserId(principal.getId());

        model.addAttribute("resumeList", resumeList);

        return "userpage/myapply";
    }

    @GetMapping("/mymatching")
    public String mymatching(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("회원 인증이 되지 않았습니다. 로그인을 해주세요.", HttpStatus.UNAUTHORIZED);
        }
        if (principal != null) {
            List<UserMatchingDto> userMatchingDto = userRepository.userMatching(principal.getId());
            model.addAttribute("userMatching", userMatchingDto);
        }

        List<RecruitmentPostListRespDto> posts = recruitmentPostRepository.findByPost();
        // d-day 계산
        for (RecruitmentPostListRespDto post : posts) {
            post.calculateDiffDays(); // D-Day 계산
        }

        model.addAttribute("Posts", posts);
        return "userpage/mymatching";
    }

    @GetMapping("/mybookmark")
    public String mybookmark() {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("회원 인증이 되지 않았습니다. 로그인을 해주세요.", HttpStatus.UNAUTHORIZED);
        }
        return "userpage/mybookmark";
    }
}
