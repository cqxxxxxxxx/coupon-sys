package cn.xiaohuodui.service;


import cn.xiaohuodui.model.Activity;

import java.text.ParseException;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ActivityService {

    /**
     * @param code
     * @param title
     * @param des
     * @return
     */
    public boolean createActivity(String code, String title, String des, int total_limit, int num, String starttime, String endtime) throws ParseException;

    public boolean checkCode(String code);

    public List<Activity> getActivities(String keyword, int limit, int offset); //分页版本

    public boolean updateActivity(Activity activity);     //update

    public int countAll(String keyword);

    public Activity getinfo(String code);
}
