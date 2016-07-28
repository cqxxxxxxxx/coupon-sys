package com.cqx.controller;


import com.cqx.form.ShareQueryForm;
import com.cqx.model.Shareinfo1;
import com.cqx.service.SharedCount;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.ApplicationConstants;
import utils.JsonUtil;

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
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    String handleShare(String code, String type, String phone) {
        System.out.println("code:" + code + "type:" + type + "phone:" + phone);
        if (sharedCount.setInfo(code, phone, type)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else {
            return ApplicationConstants.RESPONSE_FAIL;
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public String jump() {
        return "queryinfo1";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String shareInfoQuery(HttpServletRequest request, String code, String type, String keyword, String starttime, String endtime) {

        String sEchoStr = request.getParameter("sEcho");
        int sEcho = sEchoStr == null ? 0 : Integer.parseInt(sEchoStr);
        String limitStr = request.getParameter("iDisplayLength");
        int limit = limitStr == null ? ApplicationConstants.CRM_PAGE_SIZE : Integer.parseInt(limitStr);
        String offsetStr = request.getParameter("iDisplayStart");
        int offset = offsetStr == null ? 0 : Integer.parseInt(offsetStr);

        ShareQueryForm form = new ShareQueryForm();
        form.setCode(code);
        form.setType(type);
        form.setLimit(limit);
        form.setOffset(offset);
        form.setKeyword(keyword);
        form.setStarttime(starttime);
        form.setEndtime(endtime);

        List<Shareinfo1> list = sharedCount.getShareInfoFenYe(form);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("sEcho", sEcho);
        results.put("iTotalDisplayRecords", list.size());
        results.put("aaData", list);
        results.put("iTotalRecords", list.size());

        return JsonUtil.writeObjectAsString(results);

    }

}
