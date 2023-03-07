package shop.mtcoding.job.model.bookmark;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Bookmark {
    private int id;
    private int userId;
    private int recruitmentId;
    private Timestamp createdAt;
}
