package com.cqx.service.impl;


import com.cqx.dao.Activity1Mapper;
import com.cqx.model.Activity1;
import com.cqx.service.ActivityList;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/20.
 */

@Service("ActivityList")
public class ActivityListImpl implements ActivityList {


    private List<Activity1> list;

    //自动注入BEAN 默认byName 可以设定byType  Autowired默认byType
    @Resource(name = "Activity1Mapper")
    private Activity1Mapper activity1Mapper;

    public List<Activity1> getActivitys() {

        list = activity1Mapper.listAll();


        return list;
    }
}
