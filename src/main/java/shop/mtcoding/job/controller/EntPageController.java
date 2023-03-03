package shop.mtcoding.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForEntRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostListRespDto;
import shop.mtcoding.job.dto.user.UserMatchingDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.apply.ApplyRepository;
import shop.mtcoding.job.model.applyResume.ApplyResume;
import shop.mtcoding.job.model.applyResume.ApplyResumeRepository;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.model.user.UserRepository;

@Controller
public class EntPageController {
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

    @GetMapping("/myapplicant")
    public String mypage(Model model) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("기업회원으로 로그인을 해주세요", HttpStatus.UNAUTHORIZED);
        }

        List<ApplyListForEntRespDto> applyList = applyRepository.findByEnterpriseId(principalEnt.getId());
        model.addAttribute("applyLists", applyList);

        List<ApplyResume> resumeList = applyResumeRepository.findByEnterpriseId(principalEnt.getId());

        model.addAttribute("resumeList", resumeList);

        return "entpage/myapplicant";
    }

    @GetMapping("/myrecommend")
    public String mymatching(Model model) {
        return "entpage/myrecommend";
    }
}
