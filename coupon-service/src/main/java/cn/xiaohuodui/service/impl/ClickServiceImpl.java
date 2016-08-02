package cn.xiaohuodui.service.impl;


import cn.xiaohuodui.dao.ClickinfoMapper;
import cn.xiaohuodui.form.ClickQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.IpGroup;
import cn.xiaohuodui.service.ClickService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
@Service("ClickService")
public class ClickServiceImpl implements ClickService {

    @Resource
    private ClickinfoMapper clickinfoMapper;

    private Clickinfo clickinfo;

    private Timestamp ts;


    //官方分享的URL被点击后  把点击者信息插入clickinfo表
    public void setInfo(String code, String ip, String browser) {

        clickinfo = new Clickinfo();
        if (code.length() == 8) {      //官方code8位长， TYPE为0
            clickinfo.setType("0");
        }else {
            clickinfo.setType("1"); //不是官方的URL 则type设为1
        }
        ts = new Timestamp(System.currentTimeMillis());
        clickinfo.setCreated(ts);
        clickinfo.setBrowser(browser);
        clickinfo.setCode(code);
        clickinfo.setIp(ip);


        if (clickinfoMapper.insert(clickinfo) != 0) {
            System.out.println("插入成功");
        } else
            System.out.println("插入失败");


    }

    //提取出info表中指定code(对应一个活动编号)，type(对应一个分享者)的信息  个人的
    public List<Clickinfo> getClickInfo(Map map) {

        List<Clickinfo> list = clickinfoMapper.ListP(map);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }

    }

    //提取出info表中指定code(对应一个活动编号)的信息   官方的
    public List<Clickinfo> getClickInfo(String code) {

        List<Clickinfo> list = clickinfoMapper.ListO(code);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    //分页版本  需要code type offset limit   keyword可选
    public List<Clickinfo> getClickInfoFenYe(ClickQueryForm form) {
        System.out.println("-----ClickServiceImpl endtime:" + form.getEndtime());
        List<Clickinfo> list = clickinfoMapper.listFenYe(form.getCode(), form.getType(), form.getKeyword(), form.getLimit(), form.getOffset(), form.getBrowser(), form.getStarttime(), form.getEndtime());
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    public int countAll(ClickQueryForm form) {
        return clickinfoMapper.countAll(form.getKeyword(), form.getCode(), form.getType(), form.getBrowser(), form.getStarttime(), form.getEndtime());
    }

    public List<IpGroup> getIpGroupFenYe(int offset, int limit, String keyword) {

        return clickinfoMapper.groupByIp(offset, limit, keyword);

    }

    public int countAllIpGroup(String keyword) {
        List<IpGroup> list = clickinfoMapper.countIpAll(keyword);
        return list.size();
    }

}
