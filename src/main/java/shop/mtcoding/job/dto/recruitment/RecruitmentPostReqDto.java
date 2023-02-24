package shop.mtcoding.job.dto.recruitment;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.dto.recruitment.RecruitmentPostRespDto.RecruitmentPostDetailRespDto;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPost;

public class RecruitmentPostReqDto {

    @Setter
    @Getter
    public static class RecruitmentPostDetailReqDto {

        private String title;
        private String career;
        private String education;
        private String sector;
        private String pay;
        private String address;
        private String position;
        private String content;

        public RecruitmentPost toModel(int enterpriseId) {
            RecruitmentPost recruitmentPost = new RecruitmentPost();
            recruitmentPost.setTitle(title);
            recruitmentPost.setEnterpriseId(enterpriseId);
            recruitmentPost.setCareer(career);
            recruitmentPost.setEducation(education);
            recruitmentPost.setSector(sector);
            recruitmentPost.setPay(pay);
            recruitmentPost.setAddress(address);
            recruitmentPost.setPosition(position);
            recruitmentPost.setContent(content);

            return recruitmentPost;
        }
    }
}