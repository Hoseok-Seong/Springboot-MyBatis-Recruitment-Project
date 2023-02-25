package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.apply.ApplyReqDto.InsertApplyReqDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.model.apply.Apply;
import shop.mtcoding.job.model.apply.ApplyRepository;

@Service
public class ApplyService {
    @Autowired
    private ApplyRepository applyRepository;

    @Transactional
    public void 이력서제출(InsertApplyReqDto insertApplyReqDto, int userId) {
        Apply applyPS =  applyRepository.findById(userId)
        if (resumePS == null) {
            throw new CustomApiException("존재하지 않는 게시글입니다");
        }
        if (resumePS.getUserId() != userId) {
            throw new CustomApiException("해당 게시글을 삭제할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }

        int result = applyRepository.insert(userId, insertApplyReqDto.getEnterpriseId(),
                insertApplyReqDto.getRecruitmentPostId(), insertApplyReqDto.getSector());
        if (result != 1) {
            throw new CustomApiException("이력서 제출 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
