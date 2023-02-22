package shop.mtcoding.job.model.enterprise;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Enterprise {
    private int id;
    private String enterpriseName;
    private String password;
    private String address;
    private String contact;
    private String image;
    private String email;
    private String sector;
    private String size;
    private Timestamp createdAt;
}
