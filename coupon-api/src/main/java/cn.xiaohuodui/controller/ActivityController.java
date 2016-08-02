package cn.xiaohuodui.controller;

import cn.xiaohuodui.model.Activity;
import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


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

    @Resource(name = "ActivityService")
    ActivityService activityService;

/*

    @RequestMapping(value = "/info/{code}/{type}", method = RequestMethod.GET)
    public String activityInfo(@PathVariable("code") String code, @PathVariable("type") String type, Model model) {
        Activity activity = activityService.getinfo(code);
        model.addAttribute("code", code);
        model.addAttribute("type", type);
        model.addAttribute("activity", activity);
        return "url";
    }
*/

//  跳转方法
    @RequestMapping(method = RequestMethod.GET)
    public String activities() {
        return "activities";
    }

//  跳转方法
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateActivity() {
        return "updateActivity";
    }

//  对活动进行更新操作
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public
    @ResponseBody
    String updateActivity(String code, String title, String des) {
        Activity activity = new Activity();
        if(!title.equals("")){
            activity.setTitle(title);
        }
        if (!des.equals("")){
            activity.setDes(des);
        }
        activity.setCode(code);
        if (activityService.updateActivity(activity))
            return ApplicationConstants.RESPONSE_SUCCESS;
        return ApplicationConstants.RESPONSE_FAIL;
    }

//  datatables 的分页处理
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

        System.out.println("offset:" + request.getParameter("iDisplayStart"));
        System.out.println("limit:" + request.getParameter("iDisplayLength"));
        System.out.println("keyword:" + keyword + "--limit:" + limit + "--offset:" + offset);


        List<Activity> list = activityService.getActivitys(keyword, limit, offset);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("sEcho", sEcho);
        results.put("iTotalDisplayRecords", activityService.countAll(keyword));
        results.put("aaData", list);
        results.put("iTotalRecords", activityService.countAll(keyword));
        System.out.println(JsonUtil.writeObjectAsString(results));

        return JsonUtil.writeObjectAsString(results);
    }

//  添加页面的跳转
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addActivity() {
        return "addActivity";
    }

//  进行活动添加操作
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    String addActivity(String code, String title, String des) {
        if (activityService.createActivity(code, title, des))
            return ApplicationConstants.RESPONSE_SUCCESS;
        else
            return ApplicationConstants.RESPONSE_FAIL;
    }


}
