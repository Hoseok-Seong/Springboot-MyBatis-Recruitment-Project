package shop.mtcoding.job.model.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Apply {
    private int id;
    private int userId;
    private int enterpriseId;
    private int recruitmentPostId;
    private String sector;
    private int resumeId;
    private boolean result;
    private Timestamp createdAt;
}
