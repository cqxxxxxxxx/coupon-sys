package cn.xiaohuodui.rest;

import cn.xiaohuodui.form.PhoneForm;
import cn.xiaohuodui.service.ShareService;
import cn.xiaohuodui.vo.InviteinfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Author :chenqisheng
 * Date   :2016-08-02 17:10.
 */
@Controller
public class InviteApi {
    @Autowired
    ShareService shareService;

    /**
     * 获取 手机号的邀请信息
     *
     * @return
     */
    @RequestMapping(value = "/v1/invites", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    InviteinfoVo query(@RequestParam("phone") String phone) {
        return shareService.getInviteinfoVoByPhone(phone);
    }

    /**
     * 反馈手机的 注册行为
     *
     * @return
     */

    @RequestMapping(value = "/v1/reg", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    void postReg(@ModelAttribute PhoneForm phoneForm) {
        shareService.markReg(phoneForm);
    }
}
