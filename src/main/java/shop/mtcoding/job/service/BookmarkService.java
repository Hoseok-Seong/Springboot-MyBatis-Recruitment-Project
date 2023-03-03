package shop.mtcoding.job.service;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.bookmark.Bookmark;
import shop.mtcoding.job.model.bookmark.BookmarkRepository;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;

@Service
@RequiredArgsConstructor
public class BookmarkService {

    private final BookmarkRepository bookmarkRepository;
    private final RecruitmentPostRepository recruitmentPostRepository;

    public void 북마크하기(int enterpriseId, int principalId) {
        Bookmark bookmarkTemp = new Bookmark(enterpriseId, principalId);

        if (bookmarkRepository.findByBoardIdAndUserId(bookmarkTemp) != null) {
            throw new CustomApiException("이미 좋아요한 게시물 입니다");
        }
        try {
            bookmarkRepository.insert(bookmarkTemp);
        } catch (Exception e) {
            throw new CustomApiException("서버 오류 : 좋아요 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
