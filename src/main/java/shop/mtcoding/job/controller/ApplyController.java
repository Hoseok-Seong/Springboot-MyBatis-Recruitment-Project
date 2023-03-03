package shop.mtcoding.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.dto.apply.ApplyReqDto.InsertApplyReqDto;
import shop.mtcoding.job.dto.apply.ApplyReqDto.UpdateApplicantResultReqDto;
import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForEntRespDto;
import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForUserRespDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.apply.ApplyRepository;
import shop.mtcoding.job.model.applyResume.ApplyResume;
import shop.mtcoding.job.model.applyResume.ApplyResumeRepository;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.service.ApplyService;

@Controller
public class ApplyController {
    @Autowired
    private HttpSession session;

    @Autowired
    private ApplyService applyService;

    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private ApplyResumeRepository applyResumeRepository;

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @PostMapping("/apply/{id}")
    public @ResponseBody ResponseEntity<?> insertApply(@RequestBody InsertApplyReqDto insertApplyReqDto,
            @PathVariable int id) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("회원 인증이 실패했습니다", HttpStatus.UNAUTHORIZED);
        }

        RecruitmentPostDetailRespDto recruitmentPostDto = recruitmentPostRepository.findByIdWithEnterpriseId(id);

        // d-day 계산
        long diffDays = DateUtil.deadline(recruitmentPostDto.getDeadline());

        if (diffDays < 0) {
            throw new CustomApiException("채용공고 제출기간이 지났습니다", HttpStatus.UNAUTHORIZED);
        }

        applyService.이력서제출(insertApplyReqDto, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 제출 성공", null), HttpStatus.CREATED);
    }

    @DeleteMapping("/apply/{id}")
    public @ResponseBody ResponseEntity<?> deleteApply(@PathVariable int id) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("회원 인증이 실패했습니다", HttpStatus.UNAUTHORIZED);
        }

        applyService.이력서제출취소(id, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "지원서 삭제 성공", null), HttpStatus.OK);

    }

    @GetMapping("/applyList")
    public String applyList(Model model, ApplyListForUserRespDto applyListForUserRespDto) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("회원 인증이 되지 않았습니다. 로그인을 해주세요.", HttpStatus.UNAUTHORIZED);
        }
        List<ApplyListForUserRespDto> applyList = applyRepository.findByUserId(
                principal.getId());
        model.addAttribute("applyLists", applyList);

        List<ApplyResume> resumeList = applyResumeRepository.findByUserId(principal.getId());

        model.addAttribute("resumeList", resumeList);

        return "apply/applyList";
    }

    @GetMapping("/applicantList")
    public String applicantList(Model model, ApplyListForEntRespDto applyListForEntRespDto) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("기업회원으로 로그인을 해주세요", HttpStatus.UNAUTHORIZED);
        }

        List<ApplyListForEntRespDto> applyList = applyRepository.findByEnterpriseId(principalEnt.getId());
        model.addAttribute("applyLists", applyList);

        List<ApplyResume> resumeList = applyResumeRepository.findByEnterpriseId(principalEnt.getId());

        model.addAttribute("resumeList", resumeList);

        return "apply/applicantList";
    }

    @PutMapping("/apply/{id}")
    public @ResponseBody ResponseEntity<?> updateResult(
            @RequestBody UpdateApplicantResultReqDto updateApplicantResultReqDto, @PathVariable int id) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("기업회원으로 로그인을 해주세요", HttpStatus.UNAUTHORIZED);
        }

        applyService.합격불합격(id, updateApplicantResultReqDto, principalEnt.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "처리 성공", null), HttpStatus.OK);
    }

}
