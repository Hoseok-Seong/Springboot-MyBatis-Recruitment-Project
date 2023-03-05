package shop.mtcoding.job.model.user;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User implements Serializable {
    private int id;
    private String username;
    private String password;
    private String salt;
    private String name;
    private String email;
    private String contact;
    private Timestamp createdAt;
}
