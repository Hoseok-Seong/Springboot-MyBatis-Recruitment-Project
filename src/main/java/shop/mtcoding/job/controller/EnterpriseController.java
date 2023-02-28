package shop.mtcoding.job.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.job.dto.enterprise.EnterpriseReqDto.JoinEnterpriseReqDto;
import shop.mtcoding.job.dto.enterprise.EnterpriseReqDto.LoginEnterpriseReqDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.enterprise.Enterprise;
import shop.mtcoding.job.service.EnterpriseService;

@Controller
public class EnterpriseController {

    @Autowired
    private EnterpriseService enterpriseService;

    @Autowired
    private HttpSession session;

    @PostMapping("/enterprise/login")
    public String enterpriseLogin(LoginEnterpriseReqDto loginEnterpriseReqDto) {
        if (loginEnterpriseReqDto.getEnterpriseName() == null || loginEnterpriseReqDto.getEnterpriseName().isEmpty()) {
            throw new CustomException("아이디를 작성해주세요");
        }
        if (loginEnterpriseReqDto.getPassword() == null || loginEnterpriseReqDto.getPassword().isEmpty()) {
            throw new CustomException("비밀번호를 작성해주세요");
        }
        // 1. 로그인하기 service
        Enterprise principalEnt = enterpriseService.기업로그인하기(loginEnterpriseReqDto);

        // 2. session에 저장
        session.setAttribute("principalEnt", principalEnt);

        // 3. principal 유효성 검사
        if (session.getAttribute("principalEnt") == null) {
            throw new CustomException("존재하지 않는 아이디거나 비밀번호를 다시 확인해주시기 바랍니다");
        }

        return "redirect:/";
    }

    @PostMapping("/enterprise/join")
    public String enterpriseJoin(JoinEnterpriseReqDto joinEnterpriseReqDto) {

        if (joinEnterpriseReqDto.getEnterpriseName() == null || joinEnterpriseReqDto.getEnterpriseName().isEmpty()) {
            throw new CustomException("아이디를 작성해주세요");
        }
        if (joinEnterpriseReqDto.getPassword() == null || joinEnterpriseReqDto.getPassword().isEmpty()) {
            throw new CustomException("비밀번호를 작성해주세요");
        }
        if (joinEnterpriseReqDto.getAddress() == null || joinEnterpriseReqDto.getAddress().isEmpty()) {
            throw new CustomException("주소를 작성해주세요");
        }
        if (joinEnterpriseReqDto.getEmail() == null || joinEnterpriseReqDto.getEmail().isEmpty()) {
            throw new CustomException("email을 작성해주세요");
        }
        if (joinEnterpriseReqDto.getContact() == null || joinEnterpriseReqDto.getContact().isEmpty()) {
            throw new CustomException("전화번호를 입력해주세요");
        }
        if (joinEnterpriseReqDto.getSector() == null || joinEnterpriseReqDto.getSector().isEmpty()) {
            throw new CustomException("분야를 작성해주세요");
        }
        if (joinEnterpriseReqDto.getSize() == null || joinEnterpriseReqDto.getSize().isEmpty()) {
            throw new CustomException("기업규모를 작성해주세요");
        }

        enterpriseService.기업가입하기(joinEnterpriseReqDto);

        return "redirect:/";
    }

}
