package com.cqx.controller;



import com.cqx.model.Activity1;
import com.cqx.service.ActivityList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.ApplicationConstants;
import utils.JsonUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateActivity() {
        return "updateActivity";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public
    @ResponseBody
    String updateActivity(String code, String title, String des) {
        Activity1 activity1 = new Activity1();
        activity1.setCode(code);
        activity1.setTitle(title);
        activity1.setDes(des);
        if (activityList.updateActivity(activity1))
            return ApplicationConstants.RESPONSE_SUCCESS;
        return ApplicationConstants.RESPONSE_FAIL;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String getActivities(HttpServletRequest request) {
        String keyword = request.getParameter("sSearch");
        String sEchoStr = request.getParameter("sEcho");
        int sEcho = sEchoStr == null ? 0 : Integer.parseInt(sEchoStr);
        String limitStr = request.getParameter("iDisplayLength");
        int limit = limitStr == null ? ApplicationConstants.CRM_PAGE_SIZE : Integer.parseInt(limitStr);
        String offsetStr = request.getParameter("iDisplayStart");
        int offset = offsetStr == null ? 0 : Integer.parseInt(offsetStr);

        System.out.println("offset:"+request.getParameter("iDisplayStart"));
        System.out.println("limit:"+request.getParameter("iDisplayLength"));
        System.out.println("keyword:"+keyword+"--limit:"+limit+"--offset:"+offset);


        List<Activity1> list = activityList.getActivitys1(keyword, limit, offset);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("sEcho", sEcho);
        results.put("iTotalDisplayRecords", list.size());
        results.put("aaData", list);
        results.put("iTotalRecords", list.size());
        System.out.println(JsonUtil.writeObjectAsString(results));

        return JsonUtil.writeObjectAsString(results);
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addActivity() {
        return "addActivity";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    String addActivity(String code, String title, String des) {
        if (activityList.createActivity(code, title, des))
            return ApplicationConstants.RESPONSE_SUCCESS;
        else
            return ApplicationConstants.RESPONSE_FAIL;
    }


}
