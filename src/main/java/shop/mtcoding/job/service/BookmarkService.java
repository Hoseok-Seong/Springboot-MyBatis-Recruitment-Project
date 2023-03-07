package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.bookmark.Bookmark;
import shop.mtcoding.job.model.bookmark.BookmarkRepository;

@Service
@RequiredArgsConstructor
public class BookmarkService {
    @Autowired
    private BookmarkRepository bookmarkRepository;

    @Transactional
    public int 북마크하기(int recruitmentId, int userId) {
        Bookmark bookmark = new Bookmark();
        bookmark.setRecruitmentId(recruitmentId);
        bookmark.setUserId(userId);
        bookmarkRepository.insert(bookmark);
        return bookmark.getId();
    }

    @Transactional
    public void 북마크삭제(int id, int userId) {
        Bookmark bookmartPS = bookmarkRepository.findById(id);
        // 제어권이 없으므로 try, catch
        if (bookmartPS == null) {
            throw new CustomApiException("북마크 내역이 존재하지 않습니다.");
        }
        if (bookmartPS.getUserId() != userId) {
            throw new CustomApiException("유저의 북마크 내역이 존재하지 않습니다.", HttpStatus.FORBIDDEN);
        }
        int result = bookmarkRepository.deleteById(id);
        if (result != 1) {
            throw new CustomApiException("서버 에러", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}