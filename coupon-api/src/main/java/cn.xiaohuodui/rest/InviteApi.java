package cn.xiaohuodui.rest;

import cn.xiaohuodui.service.ShareService;
import cn.xiaohuodui.vo.InviteinfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Author :chenqisheng
 * Date   :2016-08-02 17:10.
 */
@Controller

public class InviteApi {
    @Autowired
    ShareService shareService;

    /**
     * 首页的banner
     *
     * @return
     */

    @RequestMapping(value = "/v1/invites", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    InviteinfoVo query(@RequestParam("phone") String phone) {
        return shareService.getInviteinfoVoByPhone(phone);
    }



}
