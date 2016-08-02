package cn.xiaohuodui.service;



import cn.xiaohuodui.model.Activity;

import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ActivityService {
    public List<Activity> getActivitys();  //返回活动列表
    public boolean createActivity(String code, String title, String des);
    public boolean checkCode(String code);
    public List<Activity> getActivitys(String keyword, int limit, int offset); //分页版本
    public boolean updateActivity(Activity activity);     //update
    public int countAll(String keyword);
    public Activity getinfo(String code);
}
