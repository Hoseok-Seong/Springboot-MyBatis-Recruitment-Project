package shop.mtcoding.job.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForUserRespDto;
import shop.mtcoding.job.dto.bookmark.BookmarkReqDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostListRespDto;
import shop.mtcoding.job.dto.userSkill.UserMatchingDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.apply.ApplyRepository;
import shop.mtcoding.job.model.applyResume.ApplyResume;
import shop.mtcoding.job.model.applyResume.ApplyResumeRepository;
import shop.mtcoding.job.model.bookmark.BookmarkRepository;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.userSkill.UserSkillRepository;

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
    private UserSkillRepository userSkillRepository;

    @Autowired
    private BookmarkRepository bookmarkRepository;

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

        List<RecruitmentPostListRespDto> posts = recruitmentPostRepository.findByPost();
        // d-day 계산
        for (RecruitmentPostListRespDto post : posts) {
            post.calculateDiffDays(); // D-Day 계산
        }

        model.addAttribute("Posts", posts);

        return "userpage/myapply";
    }

    @GetMapping("/mymatching")
    public String mymatching(Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("회원 인증이 되지 않았습니다. 로그인을 해주세요.", HttpStatus.UNAUTHORIZED);
        }
        if (principal != null) {
            List<UserMatchingDto> userMatchingDto = userSkillRepository.userMatching(principal.getId());
            model.addAttribute("userMatching", userMatchingDto);
        }

        List<RecruitmentPostListRespDto> posts = recruitmentPostRepository.findByPost();
        // d-day 계산
        for (RecruitmentPostListRespDto post : posts) {
            post.calculateDiffDays(); // D-Day 계산
        }

        model.addAttribute("Posts", posts);

        Map<Integer, String> skillMap = new HashMap<>();
        skillMap.put(1, "Java");
        skillMap.put(2, "HTML");
        skillMap.put(3, "JavaScript");
        skillMap.put(4, "VueJS");
        skillMap.put(5, "CSS");
        skillMap.put(6, "Node.js");
        skillMap.put(7, "React");
        skillMap.put(8, "ReactJS");
        skillMap.put(9, "Typescript");
        skillMap.put(10, "Zustand");
        skillMap.put(11, "AWS");
        model.addAttribute("skillMap", skillMap);
        model.addAttribute("userSkillDtos", userSkillRepository.findByUserId(principal.getId()));

        return "userpage/mymatching";
    }

    @GetMapping("/mybookmark")
    public String mybookmark(Model model, BookmarkReqDto bookmarkReqDto) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("회원 인증이 되지 않았습니다. 로그인을 해주세요.", HttpStatus.UNAUTHORIZED);
        }

        if (principal != null) {
            List<BookmarkReqDto> bookmarkDto = bookmarkRepository.findByUserId(principal.getId());
            model.addAttribute("bookmarkDto", bookmarkDto);
        }

        List<RecruitmentPostListRespDto> posts = recruitmentPostRepository.findByPost();
        // d-day 계산
        for (RecruitmentPostListRespDto post : posts) {
            post.calculateDiffDays(); // D-Day 계산
        }

        model.addAttribute("Posts", posts);

        return "userpage/mybookmark";
    }
}
