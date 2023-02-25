package shop.mtcoding.job.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.dto.recruitment.RecruitmentPostReqDto.RecruitmentPostDetailReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPost;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.service.RecruitmentService;

@Controller
public class RecruitmentController {

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Autowired
    private RecruitmentService recruitmentService;

    @Autowired
    private HttpSession session;

    @PostMapping("/recruitment")
    public @ResponseBody ResponseEntity<?> saveRecruitmentPost(
            @ModelAttribute RecruitmentPostDetailReqDto recruitmentPostDetailReqDto) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomApiException("로그인을 먼저 해주세요", HttpStatus.UNAUTHORIZED);
        }
        if (recruitmentPostDetailReqDto.getTitle() == null || recruitmentPostDetailReqDto.getTitle().isEmpty()) {
            throw new CustomApiException("제목을 작성해주세요");
        }
        if (recruitmentPostDetailReqDto.getCareer() == null || recruitmentPostDetailReqDto.getCareer().isEmpty()) {
            throw new CustomApiException("경력란을 작성해주세요");
        }
        if (recruitmentPostDetailReqDto.getEducation() == null
                || recruitmentPostDetailReqDto.getEducation().isEmpty()) {
            throw new CustomApiException("학력란을 작성해주세요");
        }
        if (recruitmentPostDetailReqDto.getPay() == null || recruitmentPostDetailReqDto.getPay().isEmpty()) {
            throw new CustomApiException("급여란을 작성해주세요");
        }
        if (recruitmentPostDetailReqDto.getSector() == null || recruitmentPostDetailReqDto.getSector().isEmpty()
                || recruitmentPostDetailReqDto.getSector().equals("Open this select menu")) {
            throw new CustomApiException("기업형태를 선택해주세요");
        }
        if (recruitmentPostDetailReqDto.getPosition() == null || recruitmentPostDetailReqDto.getPosition().isEmpty()
                || recruitmentPostDetailReqDto.getPosition().equals("Open this select menu")) {
            throw new CustomApiException("희망포지션을 선택해주세요");
        }
        if (recruitmentPostDetailReqDto.getAddress() == null || recruitmentPostDetailReqDto.getAddress().isEmpty()) {
            throw new CustomApiException("근무지역을 작성해주세요");
        }
        if (recruitmentPostDetailReqDto.getContent() == null || recruitmentPostDetailReqDto.getContent().isEmpty()) {
            throw new CustomApiException("채용공고 내용을 작성해주세요");
        }
        if (recruitmentPostDetailReqDto.getEnterpriseLogo() == null) {
            throw new CustomApiException("로고 사진을 선택해주세요");
        }

        recruitmentService.채용공고쓰기(recruitmentPostDetailReqDto, principalEnt.getId());

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
        return "recruitment/detail";
    }

    @GetMapping("recruitment/list")
    public String recruitmentPostList(Model model) {

        model.addAttribute("Posts", recruitmentPostRepository.findByPost());

        return "recruitment/list";
    }
}