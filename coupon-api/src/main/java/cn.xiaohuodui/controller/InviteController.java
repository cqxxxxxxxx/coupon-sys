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
