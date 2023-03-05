package shop.mtcoding.job.dto.recruitmentPost;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.util.DateUtil;

public class RecruitmentPostRespDto {

    @Setter
    @Getter
    public static class RecruitmentPostDetailRespDto {
        private Integer id;
        private String enterpriseId;
        private String title;
        private String career;
        private String education;
        private String pay;
        private String sector;
        private String position;
        private String content;
        private String address;
        private String enterpriseName;
        private String deadline;
        private Timestamp createdAt;
    }

    @Setter
    @Getter
    public static class RecruitmentPostListRespDto {
        private Integer id;
        private String enterpriseId;
        private String title;
        private String career;
        private String education;
        private String pay;
        private String sector;
        private String position;
        private String content;
        private String address;
        private String enterpriseLogo;
        private String enterpriseName;
        private String deadline;
        private long diffDays;
        private Timestamp createdAt;

        public void calculateDiffDays() { // D-Day 계산하는 메서드 추가
            diffDays = DateUtil.deadline(deadline);
        }
    }

    @Getter
    @Setter
    public static class RecruitmentPostSearchRespDto {
        private Integer id;
        private String title;
        private String address;
        private String enterpriseName;
        private String position;
        private String enterpriseLogo;
        private String searchString;
        private String deadline;
        private long diffDays;
        private Timestamp createdAt;

        public void calculateDiffDays() { // D-Day 계산하는 메서드 추가
            diffDays = DateUtil.deadline(deadline);
        }
    }

    @Getter
    @Setter
    public static class RecruitmentPostSkillRespDto {
        private int id;
        private int recruitmentId;
        private int skill;
    }

    @Getter
    @Setter
    public static class RecruitmentPostCategoryRespDto {
        private Integer id;
        private String title;
        private String address;
        private String enterpriseName;
        private String enterpriseLogo;
        private String career;
        private String education;
        private String sector;
        private String position;
        private String skill;
        private String deadline;
        private long diffDays;
        private Timestamp createdAt;

        public void calculateDiffDays() { // D-Day 계산하는 메서드 추가
            diffDays = DateUtil.deadline(deadline);
        }
    }
}
