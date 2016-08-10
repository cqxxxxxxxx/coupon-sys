package cn.xiaohuodui.controller.m;

import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.service.ClickService;
import cn.xiaohuodui.service.CouponService;
import cn.xiaohuodui.service.ShareService;
import cn.xiaohuodui.util.DeadLineUtil;
import cn.xiaohuodui.utils.IPUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Author :chenqisheng
 * Date   :2016-08-10 14:27.
 */
@Controller
@RequestMapping(value = "/m/invites")
public class MInviteController {
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

    /**
     * url: i.daimaniu.cn/m/invite?ref=vwZLr3&name=keepcleargas
     *
     * @param request
     * @param ref
     * @param name
     * @param model
     * @return
     */
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
            if ((System.currentTimeMillis() < starttime || System.currentTimeMillis() > endtime) || !couponService.checkRemain(ref)) {
                System.out.println(starttime + "----" + endtime);
                return "error";
            }
            model.addAttribute("type", "0");    //官方的url进来的
        } else if (ref.length() == 7) {
            System.out.println(couponService.checkRemain(ref));
            long starttime = deadLineUtil.getStarttime(ref);
            long endtime = deadLineUtil.getEndtime(ref);

            //判断时间是否在活动期间内，判断优惠券是否发光
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
}
