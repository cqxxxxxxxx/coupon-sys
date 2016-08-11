package cn.xiaohuodui.service.impl;


import cn.xiaohuodui.dao.ClickinfoMapper;
import cn.xiaohuodui.form.ClickQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.IpGroup;
import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.service.ClickService;
import cn.xiaohuodui.service.OrganizationService;
import cn.xiaohuodui.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
@Service("ClickService")
public class ClickServiceImpl implements ClickService {

    @Resource
    private ClickinfoMapper clickinfoMapper;

    @Autowired
    private ActivityService activityService;

    //官方分享的URL被点击后  把点击者信息插入clickinfo表
    public void setInfo(String code, String ip, String browser) {
        Clickinfo clickinfo = new Clickinfo();

        if (code.length() == 6) {
            clickinfo.setType("1");                     //来自个人code type1
        } else if (!activityService.checkCode(code)) {
            clickinfo.setType("0");                     //来自官方的code， TYPE为0
        } else {
            clickinfo.setType("2");                     //来自企业code， TYPE2
        }

        clickinfo.setCreated(System.currentTimeMillis());
        clickinfo.setBrowser(browser);
        clickinfo.setCode(code);
        clickinfo.setIp(ip);

        if (clickinfoMapper.insert(clickinfo) != 0) {
            System.out.println("插入成功");
        } else
            System.out.println("插入失败");
    }


    //分页版本  需要code type offset limit   keyword可选
    public List<Clickinfo> getClickInfos(ClickQueryForm form) throws ParseException {
        System.out.println("-----ClickServiceImpl endtime:" + form.getEndtime());
        Long starttime = null;
        Long endtime = null;
        if (form.getStarttime() != null) {
            starttime = DateUtil.stringToTimeStamp(form.getStarttime());
        }
        if (form.getEndtime() != null) {
            endtime = DateUtil.stringToTimeStamp(form.getEndtime());
        }

        List<Clickinfo> list = clickinfoMapper.listPage(form.getCode(), form.getType(), form.getKeyword(), form.getLimit(), form.getOffset(), form.getBrowser(), starttime, endtime);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    public int countAll(ClickQueryForm form) throws ParseException {
        Long starttime = null;
        Long endtime = null;
        if (form.getStarttime() != null) {
            starttime = DateUtil.stringToTimeStamp(form.getStarttime());
        }
        if (form.getEndtime() != null) {
            endtime = DateUtil.stringToTimeStamp(form.getEndtime());
        }
        return clickinfoMapper.countAll(form.getKeyword(), form.getCode(), form.getType(), form.getBrowser(), starttime, endtime);
    }

    public List<IpGroup> getIpGroup(int offset, int limit, String keyword) {

        return clickinfoMapper.groupByIp(offset, limit, keyword);

    }

    public int countAllIpGroup(String keyword) {
        List<IpGroup> list = clickinfoMapper.countIpAll(keyword);
        return list.size();
    }

}
