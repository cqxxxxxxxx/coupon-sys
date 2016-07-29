package com.cqx.controller;


import com.cqx.form.ClickQueryForm;
import com.cqx.model.Activity1;
import com.cqx.model.Clickinfo1;
import com.cqx.service.ActivityList;
import com.cqx.service.ClickCount;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.ApplicationConstants;
import utils.IPUtil;
import utils.JsonUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/21.
 */
@Controller
@RequestMapping(value = "/clickinfo")
public class ClickController {

    @Resource(name = "ActivityList")
    ActivityList activityList;

    @Resource(name = "ClickCount")
    ClickCount clickCount;

    private Map<String, String> map;

    @RequestMapping(value = "/{code}/{type}", method = RequestMethod.GET)
    public String clickHandler(HttpServletRequest request, @PathVariable("code") String code, @PathVariable("type") String type, Model model) {
        System.out.print("sadfasdfasfdasasdfsdafasfsfdsadfasfdafasdfasfa");
        Activity1 activity1 = activityList.getinfo(code);
        String ip = IPUtil.getIpAddr(request);
        String browser = IPUtil.getBrowser(request);
        System.out.println(ip+"---"+browser);
        model.addAttribute("code", code);
        model.addAttribute("type", type);
        model.addAttribute("activity", activity1);
        clickCount.setInfo(code, type, ip, browser);
        System.out.println(browser);
        return "invite";
    }




    @RequestMapping(method = RequestMethod.GET)
    public String jump() {
        return "queryinfo";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String clickInfoQuery(HttpServletRequest request, String code, String type,String starttime, String endtime) {
        System.out.println(request.getHeader("User-Agent"));
        System.out.println("code:" + request.getParameter("code"));
        System.out.println("type:" + request.getParameter("type"));
        System.out.println("starttime:" + request.getParameter("starttime"));
        System.out.println("endtime:" + request.getParameter("endtime"));
        System.out.println("offset:" + request.getParameter("iDisplayStart"));
        System.out.println("limit:" + request.getParameter("iDisplayLength"));
        System.out.println("keyword:" + request.getParameter("sSearch"));

         String keyword = request.getParameter("sSearch");

        String sEchoStr = request.getParameter("sEcho");
        int sEcho = sEchoStr == null ? 0 : Integer.parseInt(sEchoStr);
        String limitStr = request.getParameter("iDisplayLength");
        int limit = limitStr == null ? ApplicationConstants.CRM_PAGE_SIZE : Integer.parseInt(limitStr);
        String offsetStr = request.getParameter("iDisplayStart");
        int offset = offsetStr == null ? 0 : Integer.parseInt(offsetStr);

        ClickQueryForm form = new ClickQueryForm();
        try {
            String browser1 = URLDecoder.decode(request.getParameter("browser"),"UTF-8");
            System.out.println("browser"+browser1);
            if (!browser1.equals("")) {
                form.setBrowser(browser1);
            }
        }catch (Exception e){}
        if (!code.equals("")){
            form.setCode(code);
        }
        if (!starttime.equals("")) {
            form.setStarttime(starttime);
        }
        if (!endtime.equals("")) {
            form.setEndtime(endtime);
        }
        if (!type.equals("")) {
            form.setType(type);
        }
        if (!keyword.equals("")) {
            form.setKeyword(keyword);
        }

        form.setLimit(limit);
        form.setOffset(offset);


        List<Clickinfo1> list = clickCount.getClickInfoFenYe(form);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("sEcho", sEcho);
        results.put("iTotalDisplayRecords", clickCount.countAll(form));
        results.put("aaData", list);
        results.put("iTotalRecords", clickCount.countAll(form));

        return JsonUtil.writeObjectAsString(results);


    }
}
