package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.recruitment.RecruitmentPostReqDto.RecruitmentPostDetailReqDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPost;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;

@Service
public class RecruitmentService {

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Transactional
    public void 채용공고쓰기(RecruitmentPostDetailReqDto recruitmentPostDetailReqDto, int enterpriseId) {
        RecruitmentPost recruitmentPost = recruitmentPostDetailReqDto.toModel(enterpriseId);

        int result = recruitmentPostRepository.insert(recruitmentPost);
        if (result != 1) {
            throw new CustomException("생성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}