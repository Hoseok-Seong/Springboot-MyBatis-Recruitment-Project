package shop.mtcoding.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostReqDto.SaveRecruitmentPostReqDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostReqDto.UpdateRecruitmentPostReqDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.PostRespDto;
import shop.mtcoding.job.handler.exception.CustomApiException;
import shop.mtcoding.job.handler.exception.CustomException;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPost;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;
import shop.mtcoding.job.util.PathUtil;

@Service
public class RecruitmentService {

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Transactional
    public void 채용공고쓰기(SaveRecruitmentPostReqDto saveRecruitmentPostReqDto, int enterpriseId) {

        // 사진을 /static/image에 UUID로 변경해서 저장
        String uuidLogoName = PathUtil.writeImageFile(saveRecruitmentPostReqDto.getEnterpriseLogo());

        RecruitmentPost recruitmentPost = saveRecruitmentPostReqDto.toModel(enterpriseId, uuidLogoName);

        // 저장된 파일의 경로를 DB에 저장
        int result = recruitmentPostRepository.insert(recruitmentPost);
        if (result != 1) {
            throw new CustomException("채용공고쓰기 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 채용공고수정(int id, UpdateRecruitmentPostReqDto updateRecruitmentPostReqDto, int enterpriseId) {
        RecruitmentPost recruitmentPS = recruitmentPostRepository.findById(id);
        if (recruitmentPS == null) {
            throw new CustomApiException("없는 게시글을 수정할 수 없습니다");
        }
        if (recruitmentPS.getEnterpriseId() != enterpriseId) {
            throw new CustomApiException("게시글을 수정할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }

        // 사진을 /static/image에 UUID로 변경해서 저장
        String uuidLogoName = PathUtil.writeImageFile(updateRecruitmentPostReqDto.getEnterpriseLogo());

        RecruitmentPost recruitmentPost = updateRecruitmentPostReqDto.toModel(id, enterpriseId, uuidLogoName);

        int result = recruitmentPostRepository.updateById(recruitmentPost);
        if (result != 1) {
            throw new CustomApiException("채용공고수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public List<PostRespDto> 채용정보검색(PostRespDto postRespDto) {
        List<PostRespDto> postPSList = recruitmentPostRepository.findByTitleOrContent(postRespDto);
        return postPSList;
    }
}