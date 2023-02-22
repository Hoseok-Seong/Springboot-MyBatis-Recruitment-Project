package shop.mtcoding.job.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor // 전체 매개변수를 받는 생성자를 만든다.
@Getter
@Setter
public class ResponseDto<T> {
    private int code;
    private String msg;
    private T data;

}
