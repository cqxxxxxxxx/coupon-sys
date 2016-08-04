package cn.xiaohuodui.util.type;

/**
 * Created by cqxxxxx on 2016/8/4.
 */
public enum UploadType {

    DEAULT(0,false), APP(1,true),IMG(2,false);
    private int value;
    private boolean isPrivate;

    UploadType(int value, boolean isPrivate){
        this.value=value;
        this.isPrivate=isPrivate;
    }

    public int getValue() {
        return value;
    }

    public boolean isPrivate() {
        return isPrivate;
    }

}
