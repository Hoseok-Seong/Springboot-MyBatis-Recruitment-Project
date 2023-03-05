package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.resume.ResumeReqDto.SaveResumeReqDto;
import shop.mtcoding.job.dto.resume.ResumeReqDto.UpdateResumeReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.resume.Resume;
import shop.mtcoding.job.model.resume.ResumeRepository;

@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;

    @Transactional
    public void 이력서쓰기(SaveResumeReqDto saveResumeReqDto, int userId) {

        int result = resumeRepository.insert(userId, saveResumeReqDto.getTitle(), saveResumeReqDto.getContent(),
                saveResumeReqDto.getCareer(), saveResumeReqDto.getEducation(), saveResumeReqDto.getSkill(),
                saveResumeReqDto.getAward(), saveResumeReqDto.getLanguage(), saveResumeReqDto.getLink(),
                saveResumeReqDto.getBirthdate(), saveResumeReqDto.getAddress(),
                saveResumeReqDto.isFinish());
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

    @Transactional
    public void 이력서수정(int id, UpdateResumeReqDto updateResumeReqDto, int principalId) {
        Resume resumePS = resumeRepository.findById(id);
        if (resumePS == null) {
            throw new CustomApiException("존재하지 않는 이력서입니다");
        }
        if (resumePS.getUserId() != principalId) {
            throw new CustomApiException("해당 이력서를 수정할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }
        try {
            int result = resumeRepository.updateById(id, updateResumeReqDto.getTitle(),
                    updateResumeReqDto.getContent(),
                    updateResumeReqDto.getCareer(), updateResumeReqDto.getSkill(), updateResumeReqDto.getAward(),
                    updateResumeReqDto.getAddress(), updateResumeReqDto.getBirthdate(),
                    updateResumeReqDto.getLink(), updateResumeReqDto.getEducation(),
                    updateResumeReqDto.getLanguage(), updateResumeReqDto.isFinish());

            if (result != 1) {
                throw new CustomApiException("이력서 수정에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 문제가 발생했습니다");
        }
    }
}
