package com.cqx.service.impl;


import com.cqx.dao.Activity1Mapper;
import com.cqx.model.Activity1;
import com.cqx.service.ActivityList;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/20.
 */

@Service("ActivityList")
public class ActivityListImpl implements ActivityList {


    private List<Activity1> list;

    private Timestamp ts;

    //自动注入BEAN 默认byName 可以设定byType  Autowired默认byType
    @Resource(name = "Activity1Mapper")
    private Activity1Mapper activity1Mapper;

    public List<Activity1> getActivitys() {

        list = activity1Mapper.listAll();


        return list;
    }

    public boolean createActivity(String code, String title, String des){
        ts = new Timestamp(System.currentTimeMillis());
        Activity1 a = new Activity1();
        a.setCode(code);
        a.setTitle(title);
        a.setDes(des);
        a.setCreated(ts);
        if (this.checkCode(code)){
            activity1Mapper.insert(a);
            return true;        //注册成功
        }else {
            System.out.println("code重复");
            return false;
        }
    }


    //util
    public boolean checkCode(String code){
        list = activity1Mapper.exist(code);
        if (list.isEmpty()){
            System.out.println("list.isempty"+list.isEmpty());
            return true;      //没有重复code 可以注册
        }else
            return false;    //已经存在该code
    }
}
