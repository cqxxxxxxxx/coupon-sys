package cn.xiaohuodui.service.impl;


import cn.xiaohuodui.dao.ActivityMapper;
import cn.xiaohuodui.model.Activity;
import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.service.OrganizationService;
import cn.xiaohuodui.util.DateUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/20.
 */

@Service
public class ActivityServiceImpl implements ActivityService {

    //自动注入BEAN 默认byName 可以设定byType  Autowired默认byType
    @Resource
    private ActivityMapper activityMapper;

    @Autowired
    private OrganizationService organizationService;

    private final Logger logger = Logger.getLogger(ActivityServiceImpl.class);

    //分页版本 map中需要 offset limit  keyword可选
    public List<Activity> getActivities(String keyword, int limit, int offset) {
        List<Activity> activities = activityMapper.listPage(keyword, limit, offset);
        return activities;
    }

    /**
     * @param code
     * @param title
     * @param des
     * @return
     */
    public boolean createActivity(String code, String title, String des, int total_limit, int num, String starttime, String endtime) throws ParseException {
        Long time = System.currentTimeMillis();
        Long st = DateUtil.stringToTimeStamp(starttime);
        Long et = DateUtil.stringToTimeStamp(endtime);
        Activity activity = new Activity();
        activity.setTotalLimit(total_limit);
        activity.setNum(num);
        activity.setCode(code);
        activity.setTitle(title);
        activity.setDes(des);
        activity.setCreated(time);
        activity.setStarttime(st);
        activity.setEndtime(et);
        organizationService.checkCode(code);
        if (this.checkCode(code) && organizationService.checkCode(code)) {
            activityMapper.insert(activity);
            return true;        //注册成功
        } else {
            logger.debug("code已存在，注册失败");
            return false;
        }
    }

    //update
    public boolean updateActivity(Activity activity) {
        Long time = System.currentTimeMillis();
        activity.setUpdated(time);
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

    public boolean deleteActivity(String code) {
        if (activityMapper.deleteActivity(code) > 0) {
            return true;
        } else {
            return false;
        }
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
