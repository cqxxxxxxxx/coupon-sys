package cn.xiaohuodui.controller.m;

import cn.xiaohuodui.model.Organization;
import cn.xiaohuodui.service.*;
import cn.xiaohuodui.util.DeadLineUtil;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
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
    @Resource
    ActivityService activityService;

    @Resource
    ClickService clickService;

    @Resource
    ShareService shareService;

    @Resource
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
    public String invite(HttpServletRequest request, String ref, String name, String timestamp, Model model) {
        String ip = IPUtil.getIpAddr(request);
        String browser = IPUtil.getBrowser(request);
        Device device = DeviceUtils.getCurrentDevice(request);
        Long ts = null;
        if (timestamp != null) {
            ts = Long.parseLong(timestamp.replace(",", ""));
        }

        if (ref.length() == 6) {

            model.addAttribute("type", "1");    //个人的url进来的
            model.addAttribute("name", name);
            model.addAttribute("code", ref);

            clickService.setInfo(ref, ip, browser, ts);
            if (device.isMobile()) {
                return "m/invite";
            } else {
                return "m/web_invite";
            }
        } else if (!activityService.checkCode(ref)) {  //官方活动URL进来的
            System.out.println(couponService.checkRemain(ref));
            long starttime = deadLineUtil.getStarttime(ref);
            long endtime = deadLineUtil.getEndtime(ref);

            //判断时间是否在活动期间内，判断优惠券是否发光
            if (System.currentTimeMillis() < starttime || System.currentTimeMillis() > endtime) {
                model.addAttribute("timeout", 1);
            } else {
                model.addAttribute("timeout", 2);
            }
            if (!couponService.checkRemain(ref)) {
                model.addAttribute("remain", 1);
            } else {
                model.addAttribute("remain", 2);
            }
            model.addAttribute("name", activityService.getinfo(ref).getTitle());
            model.addAttribute("type", "0");    //官方的url进来的
            model.addAttribute("code", ref);
            clickService.setInfo(ref, ip, browser, ts);

            if (device.isMobile()) {
                return "m/officalInvite";
            } else {
                return "m/web_officalInvite";
            }
        } else {
            long starttime = deadLineUtil.getStarttime(ref);
            long endtime = deadLineUtil.getEndtime(ref);
            //判断时间是否在活动期间内，判断优惠券是否发光
            if (System.currentTimeMillis() < starttime || System.currentTimeMillis() > endtime) {
                model.addAttribute("timeout", 1);  //1代表活动结束
            } else {
                model.addAttribute("timeout", 2);
            }
            if (!couponService.checkRemain(ref)) {
                model.addAttribute("remain", 1);    //1代表优惠券发光
            } else {
                model.addAttribute("remain", 2);
            }
            Organization organization = organizationService.getinfo(ref);
            model.addAttribute("logo", organization.getLogo());
            model.addAttribute("name", organization.getName());
            model.addAttribute("type", "2");    //企业的url进来的
            model.addAttribute("code", ref);
            clickService.setInfo(ref, ip, browser, ts);

            if (device.isMobile()) {
                return "m/orgInvite";
            } else {
                return "m/web_orgInvite";
            }
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/personal")
    public String personalInvite(HttpServletRequest request, String ref, String name) {
        System.out.println(ref + "==" + name + "==" + request.getParameter("timestamp"));
        Long ts = Long.parseLong(request.getParameter("timestamp").replace(",", ""));
        System.out.println(ts);
        return "error";
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
        System.out.println(ref);
        System.out.println(type);
        System.out.println(phone);
        if (ref.length() == 6 && shareService.setInfo(ref, phone, type)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else if (shareService.setInfo(ref, phone, type) && couponService.updateSended(ref)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else {
            return ApplicationConstants.RESPONSE_FAIL;
        }
    }


    @RequestMapping(value = "/finish", method = RequestMethod.GET)
    public String redirect(HttpServletRequest request, @RequestParam(value = "type", required = false) String type, @RequestParam(value = "logo", required = false) String logo, Model model) {
        Device device = DeviceUtils.getCurrentDevice(request);
        if (type == null) {
            if (device.isMobile()) {
                return "m/regFinish";
            } else {
                return "m/web_finish";
            }
        } else {
            System.out.println(logo);
            model.addAttribute("logo", logo);
            if (device.isMobile()) {
                return "m/orgRegFinish";
            } else {
                return "m/web_orgRegFinish";
            }
        }
    }
}
