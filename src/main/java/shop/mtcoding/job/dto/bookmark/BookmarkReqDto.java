package shop.mtcoding.job.dto.bookmark;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.util.DateUtil;

@Setter
@Getter
public class BookmarkReqDto {
    private Integer recruitmentId;
    private String enterpriseName;
    private String title;
    private String sector;
    private String deadline;
    private long diffDays;

    public void calculateDiffDays() { // D-Day 계산하는 메서드 추가
        diffDays = DateUtil.deadline(deadline);
    }

}