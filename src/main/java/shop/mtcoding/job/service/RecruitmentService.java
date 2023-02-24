package shop.mtcoding.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.recruitment.RecruitmentPostReqDto.RecruitmentPostDetailReqDto;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPost;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.util.PathUtil;

@Service
public class RecruitmentService {

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Transactional
    public void 채용공고쓰기(RecruitmentPostDetailReqDto recruitmentPostDetailReqDto, int enterpriseId) {

        // 사진을 /static/image에 UUID로 변경해서 저장
        String uuidLogoName = PathUtil.writeImageFile(recruitmentPostDetailReqDto.getEnterpriseLogo());

        RecruitmentPost recruitmentPost = recruitmentPostDetailReqDto.toModel(enterpriseId, uuidLogoName);

        // 저장된 파일의 경로를 DB에 저장
        int result = recruitmentPostRepository.insert(recruitmentPost);
        if (result != 1) {
            throw new CustomException("채용공고쓰기 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}