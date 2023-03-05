package shop.mtcoding.job.dto.resume;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class ResumeReqDto {
    @Setter
    @Getter
    public static class SaveResumeReqDto {
        private String title;
        private String content;
        private String career;
        private String education;
        private String skill;
        private String award;
        private String language;
        private String link;
        private String birthdate;
        private String address;
        private boolean finish;
        private Timestamp createdAt;
    }

    @Setter
    @Getter
    public static class UpdateResumeReqDto {
        private String title;
        private String content;
        private String career;
        private String education;
        private String skill;
        private String award;
        private String language;
        private String link;
        private String birthdate;
        private String address;
        private boolean finish;
        private Timestamp createdAt;
    }
}
