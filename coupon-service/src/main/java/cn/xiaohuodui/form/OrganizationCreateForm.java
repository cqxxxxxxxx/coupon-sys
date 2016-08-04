package cn.xiaohuodui.form;

/**
 * Created by cqxxxxx on 2016/8/4.
 */
public class OrganizationCreateForm {
    private String code;
    private String name;
    private String des;
    private String logo;
    private String starttime;
    private String endtime;
    private int total_limit;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public int getTotal_limit() {
        return total_limit;
    }

    public void setTotal_limit(int total_limit) {
        this.total_limit = total_limit;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    private int num;


}
