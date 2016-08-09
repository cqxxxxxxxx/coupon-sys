package cn.xiaohuodui.constant;

/**
 * Created by cqxxxxx on 2016/8/9.
 */
public enum  ErrorCodeConstant {

    //    通用错误
    DEFAULT_ERROR(100, "默认错误"),
    RECORD_NOT_EXISTS(101, "记录不存在"),
    PARAMS_FORM_NOT_VALID(102, "参数表单不合法"),
    OPERATION_NOT_SUPPORT(103, "操作类型不支持"),
    RECORD_EXISTS(105, "记录不存在");




    private int code;
    private String des;
    private ErrorCodeConstant(int code, String des) {
        this.code = code;
        this.des = des;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }





}
