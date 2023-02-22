package shop.mtcoding.job.model.like;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Like {
    private int id;
    private int userId;
    private int recruitmentId;
    private int count;
    private Timestamp createdAt;
}
