package shop.mtcoding.job.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.dto.apply.ApplyReqDto.InsertApplyReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.service.ApplyService;

@Controller
public class ApplyController {
    @Autowired
    private HttpSession session;

    @Autowired
    private ApplyService applyService;

    @PostMapping("/apply/{id}")
    public @ResponseBody ResponseEntity<?> insertApply(@ModelAttribute InsertApplyReqDto insertApplyReqDto,
            @PathVariable int id) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 실패했습니다", HttpStatus.UNAUTHORIZED);
        }

        applyService.이력서제출(insertApplyReqDto, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "글쓰기성공", null), HttpStatus.CREATED);
    }

}
