package com.cqx.controller;


import com.cqx.model.Shareinfo1;
import com.cqx.service.SharedCount;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
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

    @RequestMapping(value = "/{code}/{type}",method = RequestMethod.POST)
    public String handleShare(@PathVariable(value = "code") String code, @PathVariable(value = "type") String type, String phone) {

        System.out.println("code:"+code+"type:"+type+"phone:"+phone);
        if (type == "offical") {
            sharedCount.setInfo(code, phone);
        } else {
            sharedCount.setInfo(code, phone, type);
        }
        return "success";
    }


    @RequestMapping(method = RequestMethod.GET)
    public
    @ResponseBody
    List<Shareinfo1>  shareInfoHandler(String code, String type) {

        if (type == "offical") {
            list = sharedCount.getShareInfo(code);

        } else {
            map = new HashMap<String, String>();
            map.put("code", code);
            map.put("type", type);
            list = sharedCount.getShareInfo(map);
        }

        return list;
    }

}
