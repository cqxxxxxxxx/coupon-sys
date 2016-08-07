package cn.xiaohuodui.controller;


import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.service.ClickService;
import cn.xiaohuodui.service.CouponService;
import cn.xiaohuodui.service.ShareService;
import cn.xiaohuodui.util.DeadLineUtil;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.IPUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @Resource(name = "CouponService")
    CouponService couponService;

    @Resource(name = "DeadLineUtil")
    DeadLineUtil deadLineUtil;

    //  邀请的URL 相当于invite.daimaniu.cn?ref=20160801
    @RequestMapping(method = RequestMethod.GET)
    public String invite(HttpServletRequest request, String ref, String name, Model model) {
        String ip = IPUtil.getIpAddr(request);
        String browser = IPUtil.getBrowser(request);
        System.out.println(ip + "---" + browser);
        System.out.println("---" + ref.length());

        System.out.println(System.currentTimeMillis());


        if (ref.length() == 8) {
            System.out.println(couponService.checkRemain(ref));
            long starttime = deadLineUtil.getStarttime(ref);
            long endtime = deadLineUtil.getEndtime(ref);

            //判断时间是否在活动期间内，判断优惠券是否发光
            if ((System.currentTimeMillis() < starttime || System.currentTimeMillis() > endtime )|| !couponService.checkRemain(ref)) {
                System.out.println(starttime + "----" + endtime);
                return "error";
            }
            model.addAttribute("type", "0");    //官方的url进来的
        } else if (ref.length() == 7) {
            System.out.println(couponService.checkRemain(ref));
            long starttime = deadLineUtil.getStarttime(ref);
            long endtime = deadLineUtil.getEndtime(ref);
            if (System.currentTimeMillis() < starttime || System.currentTimeMillis() > endtime || !couponService.checkRemain(ref)) {
                System.out.println(starttime + "----" + endtime);
                return "error";
            }
            model.addAttribute("type", "2");    //企业的url进来的
        } else {
            model.addAttribute("type", "1");    //个人的url进来的
        }
        model.addAttribute("code", ref);
        if (name == null) {
            clickService.setInfo(ref, ip, browser);
            return "officalInvite";
        } else {
            model.addAttribute("name", name);
            clickService.setInfo(ref, ip, browser);
            return "invite";
        }
    }

    //  个人URL 相当于invite.daimaniu.cn?ref=vwZLr3&name=keepcleargas
 /*   @RequestMapping(value = "/{ref}/{name}", method = RequestMethod.GET)
    public String invite(HttpServletRequest request, @PathVariable(value = "ref") String ref, @PathVariable(value = "name") String name, Model model) {
        String ip = IPUtil.getIpAddr(request);
        String browser = IPUtil.getBrowser(request);
        System.out.println(ip + "---" + browser + "-----" + name);
        model.addAttribute("type", "1");    //个人的url进来的

        model.addAttribute("code", ref);
        model.addAttribute("name", name);
        clickService.setInfo(ref, ip, browser);
        return "invite";
    }
*/

    //    手机号码提交后判断是否已经领取，并保存信息
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    String addInfo(String ref, String type, String phone) {
        System.out.println("code:" + ref + "type:" + type + "phone:" + phone);
        if (ref.length() == 6 && shareService.setInfo(ref, phone, type)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else if (shareService.setInfo(ref, phone, type) && couponService.updateSended(ref)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else {
            return ApplicationConstants.RESPONSE_FAIL;
        }
    }

    //提交成功 跳转
    @RequestMapping(value = "/finish", method = RequestMethod.GET)
    public String redirect() {
        return "invitefinish";
    }
}
