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
        Apply apply = insertApplyReqDto.toModel(userId);
        int result = applyRepository.insert(apply);
        if (result != 1) {
            throw new CustomApiException("이력서 제출 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
