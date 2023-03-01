package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.apply.ApplyReqDto.InsertApplyReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.apply.Apply;
import shop.mtcoding.job.model.apply.ApplyRepository;
import shop.mtcoding.job.model.applyResume.ApplyResumeRepository;
import shop.mtcoding.job.model.resume.Resume;
import shop.mtcoding.job.model.resume.ResumeRepository;

@Service
public class ApplyService {
    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private ApplyResumeRepository applyResumeRepository;

    @Transactional
    public void 이력서제출(InsertApplyReqDto insertApplyReqDto, int userId) {
        Apply applyPS = applyRepository.findByUserIdWithRecruitmentPostId(userId,
                insertApplyReqDto.getRecruitmentPostId());
        if (applyPS != null) {
            throw new CustomApiException("이미 이력서를 제출한 채용공고입니다");
        }

        int result = applyRepository.insert(userId, insertApplyReqDto.getEnterpriseId(),
                insertApplyReqDto.getRecruitmentPostId(), insertApplyReqDto.getSector(),
                insertApplyReqDto.getResumeId(), insertApplyReqDto.getCreatedAt());

        Resume resume = resumeRepository.findById(insertApplyReqDto.getResumeId());

        int result2 = applyResumeRepository.insert(insertApplyReqDto.getRecruitmentPostId(), resume.getUserId(),
                insertApplyReqDto.getEnterpriseId(),
                resume.getTitle(),
                resume.getContent(), resume.getCareer(), resume.getEducation(), resume.getSkill(),
                resume.getAward(), resume.getLanguage(), resume.getLink(), resume.getFile(), resume.getBirthdate(),
                resume.getAddress(),
                resume.isFinish());

        if (result != 1) {
            throw new CustomApiException("이력서 제출 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        if (result2 != 1) {
            throw new CustomApiException("이력서 제출 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 이력서제출취소(int RecruitmentPostId, int userId) {
        Apply applyPS = applyRepository.findByUserIdWithRecruitmentPostId(userId,
                RecruitmentPostId);
        if (applyPS == null) {
            throw new CustomApiException("존재하지 않는 지원서입니다");
        }
        if (applyPS.getUserId() != userId) {
            throw new CustomApiException("해당 지원서를 삭제할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }

        // 제어권이 없으므로 try, catch
        try {
            applyRepository.deleteByUserIdWithRecruitmentPostId(userId, RecruitmentPostId);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 문제가 발생했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
            // 로그를 남겨야 함 (DB or File)
        }
    }
}
