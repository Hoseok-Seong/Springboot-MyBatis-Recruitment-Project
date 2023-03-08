package shop.mtcoding.job.dto.bookmark;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookmarkEntReqDto {
    private String username;
    private String name;
    private String email;
    private String contact;
    private String title;
    private Integer recruitmentId;
}
