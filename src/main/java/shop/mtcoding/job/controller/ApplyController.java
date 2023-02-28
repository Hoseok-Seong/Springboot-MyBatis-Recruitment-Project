package shop.mtcoding.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.dto.apply.ApplyReqDto.InsertApplyReqDto;
import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForUserRespDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.apply.ApplyRepository;
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

    @PostMapping("/apply/{id}")
    public @ResponseBody ResponseEntity<?> insertApply(@RequestBody InsertApplyReqDto insertApplyReqDto,
            @PathVariable int id) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("회원 인증이 실패했습니다", HttpStatus.UNAUTHORIZED);
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
        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 제출 취소 성공", null), HttpStatus.OK);

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
        return "apply/applyListForUser";
    }

}
