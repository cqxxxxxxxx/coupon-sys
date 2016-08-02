package cn.xiaohuodui.service.impl;


import cn.xiaohuodui.dao.ActivityMapper;
import cn.xiaohuodui.model.Activity;

import cn.xiaohuodui.service.ActivityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/20.
 */

@Service("ActivityService")
public class ActivityServiceImpl implements ActivityService {

    //自动注入BEAN 默认byName 可以设定byType  Autowired默认byType
    @Resource(name = "ActivityMapper")
    private ActivityMapper activityMapper;

    public List<Activity> getActivitys() {
        List<Activity> list = activityMapper.listAll();
        return list;
    }

    //分页版本 map中需要 offset limit  keyword可选
    public List<Activity> getActivitys(String keyword, int limit, int offset) {
        List<Activity> list = activityMapper.listFenYe(keyword, limit, offset);
        return list;
    }


    public boolean createActivity(String code, String title, String des) {
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        Activity a = new Activity();
        a.setCode(code);
        a.setTitle(title);
        a.setDes(des);
        a.setCreated(ts);
        if (this.checkCode(code)) {
            activityMapper.insert(a);
            return true;        //注册成功
        } else {
            System.out.println("code重复");
            return false;
        }
    }

    //update
    public boolean updateActivity(Activity activity) {
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        activity.setUpdated(ts);
        if (activityMapper.updateActivity(activity) > 0) {
            return true;
        }
        return false;
    }

    public int countAll(String keyword) {
        return activityMapper.countAll(keyword);
    }

    public Activity getinfo(String code) {
        Activity activity = activityMapper.selectByCode(code);
        return activity;
    }


    //util
    public boolean checkCode(String code) {
        List<Activity> list = activityMapper.exist(code);
        if (list.isEmpty()) {
            System.out.println("list.isempty" + list.isEmpty());
            return true;      //没有重复code 可以注册
        } else
            return false;    //已经存在该code
    }

}
