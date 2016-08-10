package cn.xiaohuodui.controller.m;

import cn.xiaohuodui.service.*;
import cn.xiaohuodui.util.DeadLineUtil;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Author :chenqisheng
 * Date   :2016-08-10 14:27.
 */
@Controller
@RequestMapping(value = "/m/invite")
public class MInviteController {
    @Resource(name = "ActivityService")
    ActivityService activityService;

    @Resource(name = "ClickService")
    ClickService clickService;

    @Resource(name = "ShareService")
    ShareService shareService;

    @Resource(name = "CouponService")
    CouponService couponService;

    @Autowired
    OrganizationService organizationService;

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
        System.out.println(ref.length());

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
            model.addAttribute("code", ref);
            clickService.setInfo(ref, ip, browser);
            return "officalInvite";

        } else if (ref.length() == 7) {

            System.out.println(couponService.checkRemain(ref));
            long starttime = deadLineUtil.getStarttime(ref);
            long endtime = deadLineUtil.getEndtime(ref);

            //判断时间是否在活动期间内，判断优惠券是否发光
            if (System.currentTimeMillis() < starttime || System.currentTimeMillis() > endtime || !couponService.checkRemain(ref)) {
                System.out.println(starttime + "----" + endtime);
                return "error";
            }

            model.addAttribute("logo", organizationService.getinfo(ref).getLogo());
            model.addAttribute("name", organizationService.getinfo(ref).getName());
            System.out.println("name:"+ organizationService.getinfo(ref).getName());
            model.addAttribute("type", "2");    //企业的url进来的
            model.addAttribute("code", ref);
            clickService.setInfo(ref, ip, browser);
            return "orgInvite";

        } else {

            model.addAttribute("type", "1");    //个人的url进来的
            model.addAttribute("name", name);
            clickService.setInfo(ref, ip, browser);
            return "invite";
        }




    }

    /**
     * 手机号码提交后判断是否已经领取，并保存信息
     *
     * @param ref
     * @param type
     * @param phone
     * @return
     */
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
    
    @RequestMapping(value = "/finish", method = RequestMethod.GET)
    public String redirect() {
        return "regFinish";
    }

    @RequestMapping(value = "/orgfinish", method = RequestMethod.GET)
    public String redirect1() {
        return "orgRegFinish";
    }
}
