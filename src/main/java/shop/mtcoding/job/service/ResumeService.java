package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.resume.ResumeReqDto.ResumeSaveReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
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
                resumeSaveReqDto.getFile(), resumeSaveReqDto.getBirthdate(), resumeSaveReqDto.getAddress());
        if (result != 1) {
            throw new CustomApiException("글 작성이 실패하였습니다", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
