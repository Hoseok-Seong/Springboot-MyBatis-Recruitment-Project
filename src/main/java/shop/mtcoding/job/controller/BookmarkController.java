package shop.mtcoding.job.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.job.dto.ResponseDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.bookmark.BookmarkRepository;
import shop.mtcoding.job.model.user.User;
import shop.mtcoding.job.service.BookmarkService;

@Controller
public class BookmarkController {

    @Autowired
    private HttpSession session;

    @Autowired
    private BookmarkService bookmarkService;

    @Autowired
    private BookmarkRepository bookmarkRepository;

    @PostMapping("/detail/{id}/bookmark")
    public ResponseEntity<?> bookmark(@PathVariable("id") int enterpriseId) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("로그인이 필요합니다", HttpStatus.UNAUTHORIZED);
        }
        System.out.println("test1 : " + enterpriseId);
        System.out.println("test2 : " + principal.getId());
        bookmarkService.북마크하기(enterpriseId, principal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "북마크 성공", null), HttpStatus.OK);
    }

    @DeleteMapping("/bookmark/{id}")
    public @ResponseBody ResponseEntity<?> delete(@PathVariable int id) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("회원 인증이 실패했습니다", HttpStatus.UNAUTHORIZED);
        }

        bookmarkService.북마크삭제(id, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "북마크 삭제 성공", null), HttpStatus.OK);

    }
}
