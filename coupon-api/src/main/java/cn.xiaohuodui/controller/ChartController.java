package cn.xiaohuodui.controller;


import cn.xiaohuodui.form.ViewsQueryForm;
import cn.xiaohuodui.service.ClickService;
import cn.xiaohuodui.service.ShareService;
import cn.xiaohuodui.util.DateUtil;
import cn.xiaohuodui.utils.JsonUtil;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.*;

/**
 * Created by cqxxxxx on 2016/8/18.
 */
@RequestMapping("/chart")
public class ChartController {
    @Autowired
    ClickService clickService;

    @Autowired
    ShareService shareService;

    @RequestMapping(method = RequestMethod.GET)
    public
    @ResponseBody
    String getViewsData(@RequestParam(value = "code", required = false) String code, @RequestParam(value = "begin", required = false) String begin, @RequestParam(value = "end", required = false) String end) throws ParseException {
        ViewsQueryForm viewsQueryForm = new ViewsQueryForm();
        Long beginDate, endDate;
        Map<String, Integer> views, distinctIpViews, registrations, appRegistrations;
        Set<String> viewsKey, distinctIpViewsKey, registrationsKey, appRegistrationsKey;
        Collection<Integer> vValues, dValues, rValues, aValues;

        if (!code.equals("") && code != null){
            viewsQueryForm.setCode(code);
        }

        if (!begin.equals("") && begin != null){
            beginDate = DateUtil.stringToTimeStamp(begin);
            viewsQueryForm.setBegin(beginDate);
        }
        if (!end.equals("") && end != null){
            endDate = DateUtil.stringToTimeStamp(end);
            viewsQueryForm.setEnd(endDate);
        }

        views = clickService.getViews(viewsQueryForm); //获取访问总量的map
        distinctIpViews = clickService.getViewsDistinctIp(viewsQueryForm); //获取IP不重复的访问量
        registrations = shareService.getRegistrations(viewsQueryForm); //获取注册数量
        appRegistrations = shareService.getAppRegistrations(viewsQueryForm); //获取APP上注册的数量

        viewsKey = views.keySet();          //总访问量的key 即日期
        vValues = views.values();              //总访问量的value 即访问数 跟日期一起对应
        distinctIpViewsKey = distinctIpViews.keySet();
        dValues = distinctIpViews.values();
        registrationsKey = registrations.keySet();
        rValues = registrations.values();
        appRegistrationsKey = appRegistrations.keySet();
        aValues = appRegistrations.values();

        Map<String, Object> results = new HashMap<String, Object>();
        results.put("vCategories", viewsKey);
        results.put("dCategories", distinctIpViewsKey);
        results.put("rCategories", registrationsKey);
        results.put("aCategories", appRegistrationsKey);
        results.put("vValues", vValues);
        results.put("dValues", dValues);
        results.put("rValues", rValues);
        results.put("aValues", aValues);

        return JsonUtil.writeObjectAsString(results);
    }

}
