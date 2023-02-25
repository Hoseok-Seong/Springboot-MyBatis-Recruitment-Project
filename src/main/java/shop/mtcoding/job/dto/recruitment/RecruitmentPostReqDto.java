package shop.mtcoding.job.dto.recruitment;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPost;

public class RecruitmentPostReqDto {

    @Setter
    @Getter
    public static class SaveRecruitmentPostReqDto {
        private String title;
        private String career;
        private String education;
        private String sector;
        private String pay;
        private String address;
        private String position;
        private String content;
        private MultipartFile enterpriseLogo;

        public RecruitmentPost toModel(int enterpriseId, String enterpriseLogo) {
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
            recruitmentPost.setEnterpriseLogo(enterpriseLogo);
            return recruitmentPost;
        }
    }

    @Setter
    @Getter
    public static class UpdateRecruitmentPostReqDto {
        private String title;
        private String career;
        private String education;
        private String sector;
        private String pay;
        private String address;
        private String position;
        private String content;
        private MultipartFile enterpriseLogo;

        public RecruitmentPost toModel(int id, int enterpriseId, String enterpriseLogo) {
            RecruitmentPost recruitmentPost = new RecruitmentPost();
            recruitmentPost.setId(id);
            recruitmentPost.setTitle(title);
            recruitmentPost.setEnterpriseId(enterpriseId);
            recruitmentPost.setCareer(career);
            recruitmentPost.setEducation(education);
            recruitmentPost.setSector(sector);
            recruitmentPost.setPay(pay);
            recruitmentPost.setAddress(address);
            recruitmentPost.setPosition(position);
            recruitmentPost.setContent(content);
            recruitmentPost.setEnterpriseLogo(enterpriseLogo);
            return recruitmentPost;
        }
    }

}