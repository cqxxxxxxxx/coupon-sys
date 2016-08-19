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
     boolean createActivity(String code, String title, String des, int total_limit, int num, String starttime, String endtime) throws ParseException;

     boolean checkCode(String code);

     List<Activity> getActivities(String keyword, int limit, int offset); //分页版本

     boolean updateActivity(Activity activity);     //update

     int countAll(String keyword);

     Activity getinfo(String code);

     boolean deleteActivity(String code);
}
