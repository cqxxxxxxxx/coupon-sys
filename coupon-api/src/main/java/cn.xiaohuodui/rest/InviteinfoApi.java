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
 * Created by cqxxxxx on 2016/8/3.
 */
@Controller
public class InviteinfoApi {
    @Autowired
    ShareService shareService;

    /**
     *
     * @param phone
     * @return
     */
    @RequestMapping(value = "/v2/invites", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    InviteinfoVo query(@RequestParam("phone") String phone) {
        return shareService.getInviteinfoVoByPhone(phone);
    }
}

