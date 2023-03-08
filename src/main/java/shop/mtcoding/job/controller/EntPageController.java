package shop.mtcoding.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForEntRespDto;
import shop.mtcoding.job.dto.bookmark.BookmarkEntReqDto;
import shop.mtcoding.job.dto.recruitmentSkill.EnterpriseMatchingDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.apply.ApplyRepository;
import shop.mtcoding.job.model.applyResume.ApplyResume;
import shop.mtcoding.job.model.applyResume.ApplyResumeRepository;
import shop.mtcoding.job.model.bookmark.BookmarkRepository;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.model.recruitmentSkill.RecruitmentSkillRepository;

@Controller
public class EntPageController {
    @Autowired
    private HttpSession session;

    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private ApplyResumeRepository applyResumeRepository;

    @Autowired
    private RecruitmentSkillRepository recruitmentSkillRepository;

    @Autowired
    private BookmarkRepository bookmarkRepository;

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
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("기업회원으로 로그인을 해주세요", HttpStatus.UNAUTHORIZED);
        }

        if (principalEnt != null) {
            List<EnterpriseMatchingDto> enterpriseMatchingDto = recruitmentSkillRepository
                    .enterpriseMatching(principalEnt.getId());

            model.addAttribute("enterpriseMatching", enterpriseMatchingDto);
        }

        return "entpage/myrecommend";
    }

    @GetMapping("/mybookmarkEnt")
    public String mybookmark(Model model) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("기업회원으로 로그인을 해주세요", HttpStatus.UNAUTHORIZED);
        }
        if (principalEnt != null) {
            List<BookmarkEntReqDto> bookmarkEntReqDto = bookmarkRepository.findByEnterpriseId(principalEnt.getId());
            model.addAttribute("bookmarkDto", bookmarkEntReqDto);
        }

        return "entpage/mybookmarkEnt";
    }
}
