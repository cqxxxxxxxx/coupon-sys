package cn.xiaohuodui.controller;

import cn.xiaohuodui.form.ShareQueryForm;

import cn.xiaohuodui.model.Shareinfo;
import cn.xiaohuodui.service.ShareService;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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


    @Resource(name = "ShareService")
    ShareService shareService;

//  点击跳转
    @RequestMapping(method = RequestMethod.GET)
    public String jump() {
        return "queryinfo1";
    }

//  datatables 的处理方法
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String shareInfoQuery(HttpServletRequest request, String code, String phone, String starttime, String endtime) {

        String sEchoStr = request.getParameter("sEcho");
        int sEcho = sEchoStr == null ? 0 : Integer.parseInt(sEchoStr);
        String limitStr = request.getParameter("iDisplayLength");
        int limit = limitStr == null ? ApplicationConstants.CRM_PAGE_SIZE : Integer.parseInt(limitStr);
        String offsetStr = request.getParameter("iDisplayStart");
        int offset = offsetStr == null ? 0 : Integer.parseInt(offsetStr);
        String keyword = request.getParameter("sSearch");

        ShareQueryForm form = new ShareQueryForm();
        if (!code.equals("")){
            form.setCode(code);
        }
        if (!starttime.equals("")) {
            form.setStarttime(starttime);
        }
        if (!endtime.equals("")) {
            form.setEndtime(endtime);
        }
        if (!phone.equals("")) {
            form.setPhone(phone);
        }
        if (keyword != null && !keyword.equals("")) {
            form.setKeyword(keyword);
        }
        form.setLimit(limit);
        form.setOffset(offset);

        System.out.println("-------"+phone);

        List<Shareinfo> list = shareService.getShareInfoFenYe(form);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("sEcho", sEcho);
        results.put("iTotalDisplayRecords", shareService.countAll(form));
        results.put("aaData", list);
        results.put("iTotalRecords", shareService.countAll(form));

        return JsonUtil.writeObjectAsString(results);

    }

}
