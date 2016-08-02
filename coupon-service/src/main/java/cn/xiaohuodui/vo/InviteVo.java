package cn.xiaohuodui.vo;

/**
 * Author :chenqisheng
 * Date   :2016-08-02 17:14.
 */
public class InviteVo {
    private String ref;
    private String phone;
    private long created;

    public long getCreated() {
        return created;
    }

    public void setCreated(long created) {
        this.created = created;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }
}
