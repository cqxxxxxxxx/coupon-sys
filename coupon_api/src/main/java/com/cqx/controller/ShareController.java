package com.cqx.controller;


import com.cqx.model.Shareinfo1;
import com.cqx.service.SharedCount;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.ApplicationConstants;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/21.
 */
@Controller
@RequestMapping(value = "/shareinfo")
public class ShareController {


    @Resource(name = "ShareCount")
    SharedCount sharedCount;

    private List<Shareinfo1> list;
    private Map<String, String> map;

    //领取优惠成功就返回success  反之failed
    @RequestMapping(method = RequestMethod.POST)
    public String handleShare(String code, String type, String phone) {

        System.out.println("code:" + code + "type:" + type + "phone:" + phone);
        if (type == "offical") {
            if (sharedCount.setInfo(code, phone))
                return "failed";
        } else if (sharedCount.setInfo(code, phone, type)) {
            return "failed";
        }
        return "success";
    }

    @RequestMapping(method = RequestMethod.GET)
    public String jump() {
        return "queryinfo1";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Shareinfo1> shareInfoQuery(HttpServletRequest request, String code, String type) {
        String keyword = request.getParameter("sSearch");
        String sEchoStr = request.getParameter("sEcho");
        int sEcho = sEchoStr == null ? 0 : Integer.parseInt(sEchoStr);
        String limitStr = request.getParameter("iDisplayLength");
        int limit = limitStr == null ? ApplicationConstants.CRM_PAGE_SIZE : Integer.parseInt(limitStr);
        String offsetStr = request.getParameter("iDisplayStart");
        int offset = offsetStr == null ? 0 : Integer.parseInt(offsetStr);

        List<Shareinfo1> list = sharedCount.getShareInfoFenYe(code,type,keyword,limit,offset);

       /* if (type == "offical") {
            list = clickCount.getClickInfo(code);
        } else {
            map = new HashMap<String, String>();
            map.put("code", code);
            map.put("type", type);
            list = clickCount.getClickInfo(map);
        }*/

        for(Shareinfo1 a: list){
            System.out.println("type:"+a.getType()+"--phone:"+a.getPhone());

        }
        return list;
    }

}
