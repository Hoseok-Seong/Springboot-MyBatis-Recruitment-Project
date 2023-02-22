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
    private String field;
    private Timestamp createdAt;
}
