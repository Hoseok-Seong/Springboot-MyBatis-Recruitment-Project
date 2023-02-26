package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.resume.ResumeReqDto.ResumeSaveReqDto;
import shop.mtcoding.job.dto.resume.ResumeReqDto.ResumeUpdateReqDto;
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
            throw new CustomApiException("이력서 작성이 실패하였습니다", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 이력서삭제(int id, int userId) {
        Resume resumePS = resumeRepository.findById(id);
        if (resumePS == null) {
            throw new CustomApiException("존재하지 않는 이력서입니다");
        }
        if (resumePS.getUserId() != userId) {
            throw new CustomApiException("해당 이력서를 삭제할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }

        // 제어권이 없으므로 try, catch
        try {
            resumeRepository.deleteById(id);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 문제가 발생했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
            // 로그를 남겨야 함 (DB or File)
        }
    }

    public void 이력서수정(int id, ResumeUpdateReqDto resumeUpdateReqDto, int principalId) {
        Resume resumePS = resumeRepository.findById(id);
        if (resumePS == null) {
            throw new CustomApiException("해당 이력서를 찾을 수 없습니다.");
        }
        if (resumePS.getUserId() != principalId) {
            throw new CustomApiException("해당 이력서를 수정할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }
        try {
            int result = resumeRepository.updateById(id, resumeUpdateReqDto.getTitle(),
                    resumeUpdateReqDto.getContent(),
                    resumeUpdateReqDto.getCareer(), resumeUpdateReqDto.getSkill(), resumeUpdateReqDto.getAward(),
                    resumeUpdateReqDto.getAddress(), resumeUpdateReqDto.getBirthdate(),
                    resumeUpdateReqDto.getLink(), resumeUpdateReqDto.getEducation(), resumeUpdateReqDto.getFile(),
                    resumeUpdateReqDto.getLanguage());

            if (result != 1) {
                throw new CustomApiException("이력서 수정에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            throw new CustomApiException("업데이트 실패");
        }
    }
}
