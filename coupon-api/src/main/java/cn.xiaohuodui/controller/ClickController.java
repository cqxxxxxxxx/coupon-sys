package cn.xiaohuodui.controller;

import cn.xiaohuodui.form.ClickQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.IpGroup;
import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.service.ClickService;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @Resource(name = "ActivityService")
    ActivityService activityService;

    @Resource(name = "ClickService")
    ClickService clickService;

    //  点击跳转
    @RequestMapping(method = RequestMethod.GET)
    public String jump() {
        return "queryinfo";
    }

    //  datatables 的分页处理
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String clickInfoQuery(HttpServletRequest request, String code, String starttime, String endtime) {
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
            String browser = URLDecoder.decode(request.getParameter("browser"), "UTF-8");
            System.out.println("browser" + browser);
            if (!browser.equals("")) {
                form.setBrowser(browser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (!code.equals("") && code != null) {
            form.setCode(code);
        }
        if (!starttime.equals("") && starttime != null) {
            form.setStarttime(starttime);
        }
        if (!endtime.equals("") && endtime != null) {
            form.setEndtime(endtime);
        }
        if (!keyword.equals("") && keyword != null) {
            form.setKeyword(keyword);
        }

        form.setLimit(limit);
        form.setOffset(offset);


        List<Clickinfo> list = clickService.getClickInfoFenYe(form);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("sEcho", sEcho);
        results.put("iTotalDisplayRecords", clickService.countAll(form));
        results.put("aaData", list);
        results.put("iTotalRecords", clickService.countAll(form));

        return JsonUtil.writeObjectAsString(results);
    }

    //    按IP进行分组
    @RequestMapping(value = "/ipgroup", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String getIpGroup(HttpServletRequest request) {
        String sEchoStr = request.getParameter("sEcho");
        int sEcho = sEchoStr == null ? 0 : Integer.parseInt(sEchoStr);
        String limitStr = request.getParameter("iDisplayLength");
        int limit = limitStr == null ? ApplicationConstants.CRM_PAGE_SIZE : Integer.parseInt(limitStr);
        String offsetStr = request.getParameter("iDisplayStart");
        int offset = offsetStr == null ? 0 : Integer.parseInt(offsetStr);
        String keyword = request.getParameter("sSearch");
        if (keyword.equals("")) {
            keyword = null;
        }
        System.out.println(sEcho + "--" + keyword + "--" + offset + "--" + limit);
        System.out.println(clickService.countAllIpGroup(keyword));
        List<IpGroup> list = clickService.getIpGroupFenYe(offset, limit, keyword);
        System.out.println("list:"+list);
        for (IpGroup ipg : list){
            System.out.println(ipg.toString());
        }

        Map<String, Object> results = new HashMap<String, Object>();
        results.put("sEcho", sEcho);
        results.put("iTotalDisplayRecords", clickService.countAllIpGroup(keyword));
        results.put("aaData", list);
        results.put("iTotalRecords", clickService.countAllIpGroup(keyword));
        return JsonUtil.writeObjectAsString(results);

    }
}
