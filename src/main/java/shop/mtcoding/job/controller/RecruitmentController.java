package shop.mtcoding.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostReqDto.SaveRecruitmentPostReqDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostReqDto.UpdateRecruitmentPostReqDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.PostRespDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPost;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.model.resume.ResumeRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.service.EnterpriseService;
import shop.mtcoding.job.service.RecruitmentService;

@Controller
public class RecruitmentController {

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Autowired
    private RecruitmentService recruitmentService;

    @Autowired
    private HttpSession session;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private EnterpriseService enterpriseService;

    @PutMapping("/recruitment/{id}")
    public @ResponseBody ResponseEntity<?> saveRecruitmentPost(@PathVariable int id,
            @ModelAttribute UpdateRecruitmentPostReqDto updateRecruitmentPostReqDto) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomApiException("로그인을 먼저 해주세요", HttpStatus.UNAUTHORIZED);
        }
        if (updateRecruitmentPostReqDto.getTitle() == null || updateRecruitmentPostReqDto.getTitle().isEmpty()) {
            throw new CustomApiException("제목을 작성해주세요");
        }
        if (updateRecruitmentPostReqDto.getTitle().length() > 100) {
            throw new CustomApiException("제목의 길이가 100자 이하여야 합니다");
        }
        if (updateRecruitmentPostReqDto.getCareer() == null || updateRecruitmentPostReqDto.getCareer().isEmpty()) {
            throw new CustomApiException("경력란을 작성해주세요");
        }
        if (updateRecruitmentPostReqDto.getCareer().length() > 100) {
            throw new CustomApiException("경력의 길이가 100자 이하여야 합니다");
        }
        if (updateRecruitmentPostReqDto.getEducation() == null
                || updateRecruitmentPostReqDto.getEducation().isEmpty()) {
            throw new CustomApiException("학력란을 작성해주세요");
        }
        if (updateRecruitmentPostReqDto.getEducation().length() > 100) {
            throw new CustomApiException("학력의 길이가 100자 이하여야 합니다");
        }
        if (updateRecruitmentPostReqDto.getPay() == null || updateRecruitmentPostReqDto.getPay().isEmpty()) {
            throw new CustomApiException("급여란을 작성해주세요");
        }
        if (updateRecruitmentPostReqDto.getPay().length() > 100) {
            throw new CustomApiException("급여의 길이가 100자 이하여야 합니다");
        }
        if (updateRecruitmentPostReqDto.getSector() == null || updateRecruitmentPostReqDto.getSector().isEmpty()
                || updateRecruitmentPostReqDto.getSector().equals("Open this select menu")) {
            throw new CustomApiException("기업형태를 선택해주세요");
        }
        if (updateRecruitmentPostReqDto.getPosition() == null || updateRecruitmentPostReqDto.getPosition().isEmpty()
                || updateRecruitmentPostReqDto.getPosition().equals("Open this select menu")) {
            throw new CustomApiException("희망포지션을 선택해주세요");
        }
        if (updateRecruitmentPostReqDto.getAddress() == null || updateRecruitmentPostReqDto.getAddress().isEmpty()) {
            throw new CustomApiException("근무지역을 작성해주세요");
        }
        if (updateRecruitmentPostReqDto.getAddress().length() > 100) {
            throw new CustomApiException("근무지역의 길이가 100자 이하여야 합니다");
        }
        if (updateRecruitmentPostReqDto.getContent() == null || updateRecruitmentPostReqDto.getContent().isEmpty()) {
            throw new CustomApiException("채용공고 내용을 작성해주세요");
        }
        if (updateRecruitmentPostReqDto.getEnterpriseLogo() == null) {
            throw new CustomApiException("로고 사진을 선택해주세요");
        }

        recruitmentService.채용공고수정(id, updateRecruitmentPostReqDto, principalEnt.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "글쓰기성공", null), HttpStatus.CREATED);
    }

    @PostMapping("/recruitment")
    public @ResponseBody ResponseEntity<?> saveRecruitmentPost(
            @ModelAttribute SaveRecruitmentPostReqDto saveRecruitmentPostReqDto) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomApiException("로그인을 먼저 해주세요", HttpStatus.UNAUTHORIZED);
        }
        if (saveRecruitmentPostReqDto.getTitle() == null || saveRecruitmentPostReqDto.getTitle().isEmpty()) {
            throw new CustomApiException("제목을 작성해주세요");
        }
        if (saveRecruitmentPostReqDto.getTitle().length() > 100) {
            throw new CustomApiException("제목의 길이가 100자 이하여야 합니다");
        }
        if (saveRecruitmentPostReqDto.getCareer() == null || saveRecruitmentPostReqDto.getCareer().isEmpty()) {
            throw new CustomApiException("경력란을 작성해주세요");
        }
        if (saveRecruitmentPostReqDto.getCareer().length() > 100) {
            throw new CustomApiException("경력의 길이가 100자 이하여야 합니다");
        }
        if (saveRecruitmentPostReqDto.getEducation() == null
                || saveRecruitmentPostReqDto.getEducation().isEmpty()) {
            throw new CustomApiException("학력란을 작성해주세요");
        }
        if (saveRecruitmentPostReqDto.getEducation().length() > 100) {
            throw new CustomApiException("학력의 길이가 100자 이하여야 합니다");
        }
        if (saveRecruitmentPostReqDto.getPay() == null || saveRecruitmentPostReqDto.getPay().isEmpty()) {
            throw new CustomApiException("급여란을 작성해주세요");
        }
        if (saveRecruitmentPostReqDto.getPay().length() > 100) {
            throw new CustomApiException("급여의 길이가 100자 이하여야 합니다");
        }
        if (saveRecruitmentPostReqDto.getSector() == null || saveRecruitmentPostReqDto.getSector().isEmpty()
                || saveRecruitmentPostReqDto.getSector().equals("Open this select menu")) {
            throw new CustomApiException("기업형태를 선택해주세요");
        }
        if (saveRecruitmentPostReqDto.getPosition() == null || saveRecruitmentPostReqDto.getPosition().isEmpty()
                || saveRecruitmentPostReqDto.getPosition().equals("Open this select menu")) {
            throw new CustomApiException("희망포지션을 선택해주세요");
        }
        if (saveRecruitmentPostReqDto.getAddress() == null || saveRecruitmentPostReqDto.getAddress().isEmpty()) {
            throw new CustomApiException("근무지역을 작성해주세요");
        }
        if (saveRecruitmentPostReqDto.getAddress().length() > 100) {
            throw new CustomApiException("근무지역의 길이가 100자 이하여야 합니다");
        }
        if (saveRecruitmentPostReqDto.getContent() == null || saveRecruitmentPostReqDto.getContent().isEmpty()) {
            throw new CustomApiException("채용공고 내용을 작성해주세요");
        }
        if (saveRecruitmentPostReqDto.getEnterpriseLogo() == null) {
            throw new CustomApiException("로고 사진을 선택해주세요");
        }

        recruitmentService.채용공고쓰기(saveRecruitmentPostReqDto, principalEnt.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "글쓰기성공", null), HttpStatus.CREATED);
    }

    @GetMapping("recruitment/saveForm")
    public String recruitmentSaveForm() {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("로그인을 먼저 해주세요", HttpStatus.UNAUTHORIZED);
        }
        return "recruitment/saveForm";
    }

    @GetMapping("recruitment/{id}/updateForm")
    public String recruitmentUpdateForm(@PathVariable int id, Model model) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("로그인을 먼저 해주세요", HttpStatus.UNAUTHORIZED);
        }
        RecruitmentPost recruitmentPS = recruitmentPostRepository.findById(id);
        if (recruitmentPS == null) {
            throw new CustomException("없는 게시글을 수정할 수 없습니다");
        }
        if (recruitmentPS.getEnterpriseId() != principalEnt.getId()) {
            throw new CustomException("게시글을 수정할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }

        model.addAttribute("recruitment", recruitmentPS);

        return "recruitment/updateForm";
    }

    @GetMapping("recruitment/detail/{id}")
    public String recruitmentPostDetail(@PathVariable int id, Model model) {
        model.addAttribute("recruitmentPostDtos", recruitmentPostRepository.findByIdWithEnterpriseId(id));

        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            model.addAttribute("resume", resumeRepository.findByUserId(principal.getId()));
        }

        return "recruitment/detail";
    }

    @GetMapping("recruitment/list")
    public String recruitmentPostList(Model model) {

        model.addAttribute("Posts", recruitmentPostRepository.findByPost());

        return "recruitment/list";
    }

    @PostMapping("/recruitment/search")
    public ResponseEntity<?> searchList(@RequestBody PostRespDto postRespDto, Model model) {
        List<PostRespDto> postPSList = enterpriseService.채용정보검색(postRespDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "검색 성공", postPSList), HttpStatus.OK);
    }
}