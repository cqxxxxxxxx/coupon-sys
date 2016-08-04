package cn.xiaohuodui.vo;

import cn.xiaohuodui.model.Organization;
import cn.xiaohuodui.util.DateUtil;

/**
 * Created by cqxxxxx on 2016/8/4.
 */
public class OrganizationVo {

    public OrganizationVo(Organization organization){
        this.setCode(organization.getCode());
        this.setName(organization.getName());
        this.setDes(organization.getDes());
        this.setLogo(organization.getLogo());
        this.setTotalLimit(organization.getTotalLimit());
        this.setNum(organization.getNum());
        this.setStarttime(DateUtil.timeStampToString(organization.getStarttime()));
        this.setEndtime(DateUtil.timeStampToString(organization.getEndtime()));
    }

    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    private String name;
    private String des;
    private String logo;

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

    public int getTotalLimit() {
        return totalLimit;
    }

    public void setTotalLimit(int totalLimit) {
        this.totalLimit = totalLimit;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
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

    private int totalLimit;
    private int num;
    private String starttime;
    private String endtime;
}
