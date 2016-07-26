package com.cqx.controller;



import com.cqx.model.Clickinfo1;
import com.cqx.service.ClickCount;
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
@RequestMapping(value = "/clickinfo")
public class ClickController {

    @Resource(name = "ClickCount")
    ClickCount clickCount;

    private List<Clickinfo1> list;
    private Map<String, String> map;

    @RequestMapping(value = "/{code}/{type}", method = RequestMethod.GET)
    public String clickHandler(@PathVariable("code") String code, @PathVariable("type") String type, Model model) {

        model.addAttribute("code", code);
        model.addAttribute("type", type);
        if (type == "offical") {
            clickCount.setInfo(code, "192.168.1", "IE");
        } else {
            clickCount.setInfo(code, type, "192.168.1", "IE");
        }
        return "invitePage";
    }


    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    List<Clickinfo1> clickInfoHandler(String code,String type) {


        if (type == "offical") {
            list = clickCount.getClickInfo(code);
        } else {
            map = new HashMap<String, String>();
            map.put("code", code);
            map.put("type", type);
            list = clickCount.getClickInfo(map);
        }
        for(Clickinfo1 a: list){
            System.out.println("type:"+a.getType()+"--browser:"+a.getBrowser());

        }

        return list;

        /*String  infos = JSON.toJSONString(list);
        return infos;*/
    }
}
