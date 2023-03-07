package shop.mtcoding.job.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostCategoryRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostDetailRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostListRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostSearchRespDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.bookmark.BookmarkRepository;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPost;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.model.recruitmentSkill.RecruitmentSkillRepository;
import shop.mtcoding.job.model.resume.ResumeRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.service.RecruitmentService;
import shop.mtcoding.job.util.DateUtil;

@Controller
public class RecruitmentController {

    @Autowired
    private BookmarkRepository bookmarkRepository;

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Autowired
    private RecruitmentSkillRepository recruitmentSkillRepository;

    @Autowired
    private RecruitmentService recruitmentService;

    @Autowired
    private HttpSession session;

    @Autowired
    private ResumeRepository resumeRepository;

    @DeleteMapping("/recruitment/{id}")
    public @ResponseBody ResponseEntity<?> delete(@PathVariable int id) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomApiException("회원 인증이 실패했습니다", HttpStatus.UNAUTHORIZED);
        }

        recruitmentService.채용공고삭제(id, principalEnt.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "채용공고 삭제 성공", null), HttpStatus.OK);

    }

    @PutMapping("/recruitment/{id}")
    public @ResponseBody ResponseEntity<?> updateRecruitmentPost(@PathVariable int id,
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
        if (updateRecruitmentPostReqDto.getCareer() == null || updateRecruitmentPostReqDto.getCareer().isEmpty()
                || updateRecruitmentPostReqDto.getCareer().equals("Open this select menu")) {
            throw new CustomApiException("경력을 선택해주세요");
        }
        if (updateRecruitmentPostReqDto.getEducation() == null || updateRecruitmentPostReqDto.getEducation().isEmpty()
                || updateRecruitmentPostReqDto.getEducation().equals("Open this select menu")) {
            throw new CustomApiException("학력를 선택해주세요");
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
        if (updateRecruitmentPostReqDto.getDeadline() == null || updateRecruitmentPostReqDto.getDeadline().isEmpty()) {
            throw new CustomApiException("마감기한을 설정해주세요");
        }

        LocalDate deadline = LocalDate.parse(updateRecruitmentPostReqDto.getDeadline());
        LocalDate today = LocalDate.now();
        if (deadline.isBefore(today)) {
            throw new CustomApiException("과거는 선택 할 수 없습니다.");
        }

        recruitmentService.채용공고수정(id, updateRecruitmentPostReqDto, principalEnt.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "채용공고 수정 성공", null), HttpStatus.CREATED);
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
        if (saveRecruitmentPostReqDto.getCareer() == null || saveRecruitmentPostReqDto.getCareer().isEmpty()
                || saveRecruitmentPostReqDto.getCareer().equals("Open this select menu")) {
            throw new CustomApiException("경력을 선택해주세요");
        }
        if (saveRecruitmentPostReqDto.getEducation() == null || saveRecruitmentPostReqDto.getEducation().isEmpty()
                || saveRecruitmentPostReqDto.getEducation().equals("Open this select menu")) {
            throw new CustomApiException("학력를 선택해주세요");
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
        if (saveRecruitmentPostReqDto.getDeadline() == null || saveRecruitmentPostReqDto.getDeadline().isEmpty()) {
            throw new CustomApiException("마감기한을 설정해주세요");
        }

        LocalDate deadline = LocalDate.parse(saveRecruitmentPostReqDto.getDeadline());
        LocalDate today = LocalDate.now();
        if (deadline.isBefore(today)) {
            throw new CustomApiException("과거는 선택 할 수 없습니다.");
        }

        recruitmentService.채용공고쓰기(saveRecruitmentPostReqDto, principalEnt.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "채용공고 작성 성공", null), HttpStatus.CREATED);
    }

    @GetMapping("/recruitment/saveForm")
    public String recruitmentSaveForm() {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("기업회원으로 로그인을 해주세요", HttpStatus.UNAUTHORIZED);
        }
        return "recruitment/saveForm";
    }

    @GetMapping("/recruitment/{id}/updateForm")
    public String recruitmentUpdateForm(@PathVariable int id, Model model) {
        Enterprise principalEnt = (Enterprise) session.getAttribute("principalEnt");
        if (principalEnt == null) {
            throw new CustomException("기업회원으로 로그인을 해주세요", HttpStatus.UNAUTHORIZED);
        }
        RecruitmentPost recruitmentPS = recruitmentPostRepository.findById(id);
        if (recruitmentPS == null) {
            throw new CustomException("없는 채용공고를 수정할 수 없습니다");
        }
        if (recruitmentPS.getEnterpriseId() != principalEnt.getId()) {
            throw new CustomException("채용공고를 수정할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }

        model.addAttribute("recruitment", recruitmentPS);

        // 스킬 매핑 정보를 저장한 Map 객체를 만들어서 Model 객체에 추가
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
        model.addAttribute("recruitmentPostSkillDtos", recruitmentSkillRepository.findByRecruitmentId(id));

        return "recruitment/updateForm";
    }

    @GetMapping("/recruitment/detail/{id}")
    public String recruitmentPostDetail(@PathVariable int id, Model model) {
        User principal = (User) session.getAttribute("principal");
        if (principal != null) {
            model.addAttribute("bookmarkDto",
                    bookmarkRepository.findByRecruitmentIdAndUserId(id, principal.getId()));
        }
        RecruitmentPostDetailRespDto recruitmentPostDto = recruitmentPostRepository.findByIdWithEnterpriseId(id);

        // d-day 계산
        long diffDays = DateUtil.deadline(recruitmentPostDto.getDeadline());

        // view에 상세보기 넘겨주기
        model.addAttribute("recruitmentPostDtos", recruitmentPostDto);
        model.addAttribute("dDay", diffDays); // deadline

        // 스킬 매핑 정보를 저장한 Map 객체를 만들어서 Model 객체에 추가
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
        model.addAttribute("recruitmentPostSkillDtos", recruitmentSkillRepository.findByRecruitmentId(id));

        if (principal != null) {
            model.addAttribute("resumes", resumeRepository.findByUserId(principal.getId()));
        }

        return "recruitment/detail";
    }

    @GetMapping("/recruitment/list")
    public String recruitmentPostList(Model model) {
        List<RecruitmentPostListRespDto> posts = recruitmentPostRepository.findByPost();
        // d-day 계산
        for (RecruitmentPostListRespDto post : posts) {
            post.calculateDiffDays(); // D-Day 계산
        }

        model.addAttribute("Posts", posts);

        return "recruitment/list";
    }

    @PostMapping("/recruitment/search")
    public ResponseEntity<?> searchList(@RequestBody RecruitmentPostSearchRespDto recruitmentPostSearchRespDto,
            Model model) {
        List<RecruitmentPostSearchRespDto> postPSList = recruitmentService.채용정보검색(recruitmentPostSearchRespDto);

        // d-day 계산
        for (RecruitmentPostSearchRespDto post : postPSList) {
            post.calculateDiffDays(); // D-Day 계산
        }

        return new ResponseEntity<>(new ResponseDto<>(1, "검색 성공", postPSList), HttpStatus.OK);
    }

    @PostMapping("/recruitment/category")
    public ResponseEntity<?> category(@RequestBody RecruitmentPostCategoryRespDto recruitmentPostCategoryRespDto,
            Model model) {
        List<RecruitmentPostCategoryRespDto> postPSList = recruitmentService.카테고리검색(recruitmentPostCategoryRespDto);

        // d-day 계산
        for (RecruitmentPostCategoryRespDto post : postPSList) {
            post.calculateDiffDays(); // D-Day 계산
        }

        return new ResponseEntity<>(new ResponseDto<>(1, "검색 성공", postPSList), HttpStatus.OK);
    }

}