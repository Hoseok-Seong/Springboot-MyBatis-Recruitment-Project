package shop.mtcoding.job.model.user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private int id;
    private String username;
    private String password;
    private String name;
    private String email;
    private String contact;
    private Timestamp createdAt;
}
