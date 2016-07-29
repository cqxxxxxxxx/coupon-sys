package com.cqx.service;


import com.cqx.model.Activity1;

import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ActivityList {
    public List<Activity1> getActivitys();  //返回活动列表
    public boolean createActivity(String code, String title, String des);
    public boolean checkCode(String code);
    public List<Activity1> getActivitys1(String keyword, int limit, int offset); //分页版本
    public boolean updateActivity(Activity1 activity1);     //update
    public int countAll(String keyword);
}
