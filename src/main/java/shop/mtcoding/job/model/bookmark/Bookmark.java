package shop.mtcoding.job.model.bookmark;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Bookmark {
    private int id;
    private int userId;
    private int enterpriseId;
    private int count;
    private Timestamp createdAt;

    public Bookmark(int id) {
        this.id = id;
    }

    public Bookmark(int enterpriseId, int userId) {
        this.enterpriseId = enterpriseId;
        this.userId = userId;
    }
}
