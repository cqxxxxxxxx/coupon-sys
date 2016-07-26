package com.cqx.controller;


import com.cqx.model.Activity1;
import com.cqx.service.ActivityList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/21.
 */
@Controller
@RequestMapping("/activities")
public class ActivityController {

    @Resource(name = "ActivityList")
    ActivityList activityList;

    private List<Activity1> list;

    @RequestMapping(method = RequestMethod.GET)
    public String activityList(Model model) {
        list = activityList.getActivitys();
        model.addAttribute("list", list);
        return "activities";
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
