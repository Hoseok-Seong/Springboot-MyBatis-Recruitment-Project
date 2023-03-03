package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.bookmark.Bookmark;
import shop.mtcoding.job.model.bookmark.BookmarkRepository;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.model.resume.Resume;

@Service
@RequiredArgsConstructor
public class BookmarkService {
    @Autowired
    private BookmarkRepository bookmarkRepository;

    private final RecruitmentPostRepository recruitmentPostRepository;

    public void 북마크하기(int enterpriseId, int principalId) {
        Bookmark bookmarkTemp = new Bookmark(enterpriseId, principalId);

        if (bookmarkRepository.findByBoardIdAndUserId(bookmarkTemp) != null) {
            throw new CustomApiException("이미 좋아요한 게시물 입니다");
        }
        try {
            bookmarkRepository.insert(enterpriseId, principalId);
        } catch (Exception e) {
            throw new CustomApiException("서버 오류 : 좋아요 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 북마크삭제(int id, int userId) {
        Bookmark bookmartPS = bookmarkRepository.findById(id);
        // 제어권이 없으므로 try, catch
        try {
            bookmarkRepository.deleteById(id);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 문제가 발생했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
