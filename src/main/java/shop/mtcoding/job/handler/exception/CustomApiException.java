package shop.mtcoding.job.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class CustomApiException extends RuntimeException {
    private HttpStatus status;

    public CustomApiException(String msg, HttpStatus status) {
        super(msg);
        this.status = status;
    }

    public CustomApiException(String msg) {
        this(msg, HttpStatus.BAD_REQUEST);
    }
}
