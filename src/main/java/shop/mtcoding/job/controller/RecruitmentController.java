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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.dto.recruitment.RecruitmentPostReqDto.RecruitmentPostDetailReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.enterprise.Enterprise;
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
        Enterprise principal = (Enterprise) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomException("로그인을 먼저 해주세요", HttpStatus.UNAUTHORIZED);
        }

        if (recruitmentPostDetailReqDto.getEnterpriseLogo() == null) {
            throw new CustomApiException("사진이 전송되지 않았습니다");
        }

        recruitmentService.채용공고쓰기(recruitmentPostDetailReqDto, principal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "글쓰기성공", null), HttpStatus.CREATED);
    }

    @GetMapping("recruitment/saveForm")
    public String recruitmentSaveForm() {
        return "recruitment/saveForm";
    }

    @GetMapping("recruitment/detail/{id}")
    public String recruitmentPostDetail(@PathVariable int id, Model model) {
        model.addAttribute("recruitmentPostDtos", recruitmentPostRepository.findByIdWithEnterpriseId(id));
        return "recruitment/detail";
    }

    @GetMapping("recruitment/RecruitmentInformation")
    public String recruitmentinformaiton() {
        return "recruitment/recruitmentinformaiton";
    }
}