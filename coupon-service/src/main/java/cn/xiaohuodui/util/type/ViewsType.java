package cn.xiaohuodui.util.type;

/**
 * 用于访问量的查询
 * value对应中间表的name 可以用来插入和查询
 * des没用 只是简介
 * Created by cqxxxxx on 2016/8/24.
 */
public enum ViewsType {
    VIEWS("总访问量","views"),DVIEWS("独立IP访问量","dViews"),PINVITES("有几个人分享,单人多次分享算一次","pInvites"),
    DPINVITES("分享次数，单人多次分享算多次","dpInvites"),REGISTRATIONS("注册数","registrations"),APPREGISTRATIONS("代码牛的注册数","appRegistrations");

    private String value;
    private String des;
    public String getValue(){
        return value;
    }
    public String getDes(){
        return des;
    }

    ViewsType(String des, String value){
        this.des = des;
        this.value = value;
    }

}
