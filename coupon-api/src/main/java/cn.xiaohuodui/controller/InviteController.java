package cn.xiaohuodui.controller;


import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.service.ClickService;
import cn.xiaohuodui.service.ShareService;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.IPUtil;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by cqxxxxx on 2016/8/1.
 */
@Controller
@RequestMapping(value = "/invite")
public class InviteController {

    @Resource(name = "ActivityService")
    ActivityService activityService;

    @Resource(name = "ClickService")
    ClickService clickService;

    @Resource(name = "ShareService")
    ShareService shareService;

    //  官方URL 相当于invite.daimaniu.cn?ref=20160801

    @RequestMapping(value = "/{ref}", method = RequestMethod.GET)
    public String invite(HttpServletRequest request, @PathVariable(value = "ref") String ref, Model model) {
        String ip = IPUtil.getIpAddr(request);
        String browser = IPUtil.getBrowser(request);
        System.out.println(ip + "---" + browser );
        model.addAttribute("type", "0");    //官方的url进来的
        model.addAttribute("activity", activityService.getinfo(ref));
        model.addAttribute("code", ref);
        clickService.setInfo(ref, ip, browser);
        return "invite";
    }



    //  个人URL 相当于invite.daimaniu.cn?ref=vwZLr3&name=keepcleargas
   @RequestMapping(value = "/{ref}/{name}", method = RequestMethod.GET)
    public String invite(HttpServletRequest request, @PathVariable(value = "ref") String ref, @PathVariable(value = "name") String name, Model model) {
        String ip = IPUtil.getIpAddr(request);
        String browser = IPUtil.getBrowser(request);
        System.out.println(ip + "---" + browser + "-----" + name);
        model.addAttribute("type", "1");    //个人的url进来的

        model.addAttribute("code", ref);
        model.addAttribute("name",name);
        clickService.setInfo(ref, ip, browser);
        return "invite";
    }


    //    手机号码提交后判断是否已经领取，并保存信息
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    String addInfo(String ref, String type, String phone) {
        System.out.println("code:" + ref + "type:" + type + "phone:" + phone);
        if (shareService.setInfo(ref, phone, type)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else {
            return ApplicationConstants.RESPONSE_FAIL;
        }

    }

}