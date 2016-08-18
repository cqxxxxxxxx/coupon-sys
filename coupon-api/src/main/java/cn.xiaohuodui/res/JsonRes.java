package cn.xiaohuodui.res;

public class JsonRes<T> {
    public JsonRes(T data) {
        this.data = data;
    }

    public JsonRes() {

    }

    private T data;

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public static <T> JsonRes<T> buildRes(T data) {
        return new JsonRes(data);
    }

    public static <T> JsonRes<T> buildRes() {
        return new JsonRes();
    }
}
