package cn.xiaohuodui.exception;

import cn.xiaohuodui.constant.ErrorCodeConstant;
import org.springframework.http.HttpStatus;

/**
 * Created by cqxxxxx on 2016/8/9.
 */
public class BussException extends Throwable{
    private HttpStatus httpStatus;
    private int code;

    public BussException(String message){
        super(message);
        this.httpStatus = HttpStatus.BAD_REQUEST;
        this.code = ErrorCodeConstant.DEFAULT_ERROR.getCode();
    }
    public BussException(String message, HttpStatus httpStatus){
        super(message);
        this.httpStatus = httpStatus;
        this.code = ErrorCodeConstant.DEFAULT_ERROR.getCode();
    }


    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public void setHttpStatus(HttpStatus httpStatus) {
        this.httpStatus = httpStatus;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
