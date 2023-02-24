package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.resume.ResumeReqDto.ResumeSaveReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.resume.Resume;
import shop.mtcoding.job.model.resume.ResumeRepository;

@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;

    @Transactional
    public void 이력서쓰기(ResumeSaveReqDto resumeSaveReqDto, int userId) {

        int result = resumeRepository.insert(userId, resumeSaveReqDto.getTitle(), resumeSaveReqDto.getContent(),
                resumeSaveReqDto.getCareer(), resumeSaveReqDto.getEducation(), resumeSaveReqDto.getSkill(),
                resumeSaveReqDto.getAward(), resumeSaveReqDto.getLanguage(), resumeSaveReqDto.getLink(),
                resumeSaveReqDto.getFile(), resumeSaveReqDto.getBirthdate(), resumeSaveReqDto.getAddress(),
                resumeSaveReqDto.isFinish());
        if (result != 1) {
            throw new CustomApiException("글 작성이 실패하였습니다", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 이력서삭제(int id, int userId) {
        Resume resumePS = resumeRepository.findById(id);
        if (resumePS == null) {
            throw new CustomApiException("존재하지 않는 게시글입니다");
        }
        if (resumePS.getUserId() != userId) {
            throw new CustomApiException("해당 게시글을 삭제할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }

        // 제어권이 없으므로 try, catch
        try {
            resumeRepository.deleteById(id);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 문제가 발생했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
            // 로그를 남겨야 함 (DB or File)
        }
    }
}
