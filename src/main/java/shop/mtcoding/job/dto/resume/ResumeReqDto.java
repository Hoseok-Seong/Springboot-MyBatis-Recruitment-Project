package shop.mtcoding.job.dto.resume;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

public class ResumeReqDto {
    @Setter
    @Getter
    public static class ResumeSaveReqDto {
        private String title;
        private String content;
        private String career;
        private String education;
        private String skill;
        private String award;
        private String language;
        private String link;
        private String file;
        private String birthdate;
        private String address;
        private Timestamp createdAt;
    }
}