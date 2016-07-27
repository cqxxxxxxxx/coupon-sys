package com.cqx.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cqx.model.Activity1;
import com.cqx.service.ActivityList;
import org.springframework.stereotype.Controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**
 * Created by cqxxxxx on 2016/7/21.
 */
@Controller
@RequestMapping("/activities")
public class ActivityController {

    @Resource(name = "ActivityList")
    ActivityList activityList;



    @RequestMapping(method = RequestMethod.GET)
    public String activities() {

        return "activities";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String getActivities(HttpServletRequest request){
        List<Activity1> list = activityList.getActivitys();
        String sEchoStr = request.getParameter("sEcho");
        int sEcho = sEchoStr == null ? 0 : Integer.parseInt(sEchoStr);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("sEcho",sEcho);
        results.put("iTotalDisplayRecords", list.size());
        results.put("aaData", list);
        results.put("iTotalRecords", list.size());
        System.out.println(results.toString());
        return JSON.toJSONString(results);



/*        JSONArray jsonArray = new JSONArray();
        list = activityList.getActivitys();
        jsonArray.add(list);
        System.out.println(jsonArray);
        JSONObject obj = new JSONObject();
        obj.put("sEcho", 1);
        obj.put("iTotalRecords",list.size());
        obj.put("iTotalDisplayRecords",list.size());
        obj.put("aaData", list);
        System.out.println(obj);
        return obj.toString();*/




    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addActivity(){
        return "addActivity";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    String addActivity(String code, String title, String des){
        if (activityList.createActivity(code, title, des))
            return "success";
        else
            return "failed";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateActivity(){
        return "updateActivity";
    }

}
