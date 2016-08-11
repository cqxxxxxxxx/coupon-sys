package cn.xiaohuodui.controller.m;

import cn.xiaohuodui.model.Organization;
import cn.xiaohuodui.service.*;
import cn.xiaohuodui.util.DeadLineUtil;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

        if (ref.length() == 6) {
            model.addAttribute("type", "1");    //个人的url进来的
            model.addAttribute("name", name);
            clickService.setInfo(ref, ip, browser);
            return "invite";
        } else if (!activityService.checkCode(ref)) {  //官方活动URL进来的
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

        } else {
            long starttime = deadLineUtil.getStarttime(ref);
            long endtime = deadLineUtil.getEndtime(ref);
            //判断时间是否在活动期间内，判断优惠券是否发光
            if (System.currentTimeMillis() < starttime || System.currentTimeMillis() > endtime || !couponService.checkRemain(ref)) {
                return "error";
            }
            Organization organization = organizationService.getinfo(ref);
            model.addAttribute("logo", organization.getLogo());
            model.addAttribute("name", organization.getName());
            model.addAttribute("type", "2");    //企业的url进来的
            model.addAttribute("code", ref);
            clickService.setInfo(ref, ip, browser);
            return "orgInvite";
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
        if (ref.length() == 6 && shareService.setInfo(ref, phone, type)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else if (shareService.setInfo(ref, phone, type) && couponService.updateSended(ref)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else {
            return ApplicationConstants.RESPONSE_FAIL;
        }
    }


    @RequestMapping(value = "/finish", method = RequestMethod.GET)
    public String redirect(@RequestParam(value = "type", required = false) String type) {
        if (type == null) {
            return "regFinish";
        } else {
            return "orgRegFinish";
        }
    }


}
