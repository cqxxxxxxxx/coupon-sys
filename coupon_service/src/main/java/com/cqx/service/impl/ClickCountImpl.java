package com.cqx.service.impl;


import com.cqx.dao.Clickinfo1Mapper;
import com.cqx.form.ClickQueryForm;
import com.cqx.model.Clickinfo1;
import com.cqx.service.ClickCount;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
@Service("ClickCount")
public class ClickCountImpl implements ClickCount {

    @Resource
    private Clickinfo1Mapper clickinfo1Mapper;

    private Clickinfo1 clickinfo1;

    private Timestamp ts;


    //个人分享的URL被点击后  把点击者信息插入clickinfo表
    public void setInfo(String code, String type, String ip, String browser) {
        clickinfo1 = new Clickinfo1();

        ts = new Timestamp(System.currentTimeMillis());
        clickinfo1.setCreated(ts);

        clickinfo1.setBrowser(browser);
        clickinfo1.setCode(code);
        clickinfo1.setType(type);
        clickinfo1.setIp(ip);

        if (clickinfo1Mapper.insert(clickinfo1) != 0) {
            System.out.println("插入成功");
        } else
            System.out.println("插入失败");


    }

    //官方分享的URL被点击后  把点击者信息插入clickinfo表
    public void setInfo(String code, String ip, String browser) {

        clickinfo1 = new Clickinfo1();

        ts = new Timestamp(System.currentTimeMillis());
        clickinfo1.setCreated(ts);

        clickinfo1.setBrowser(browser);
        clickinfo1.setCode(code);
        clickinfo1.setIp(ip);
        clickinfo1.setType("0");


        if (clickinfo1Mapper.insert(clickinfo1) != 0) {
            System.out.println("插入成功");
        } else
            System.out.println("插入失败");


    }

    //提取出info表中指定code(对应一个活动编号)，type(对应一个分享者)的信息  个人的
    public List<Clickinfo1> getClickInfo(Map map) {

        List<Clickinfo1> list = clickinfo1Mapper.ListP(map);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }

    }

    //提取出info表中指定code(对应一个活动编号)的信息   官方的
    public List<Clickinfo1> getClickInfo(String code) {

        List<Clickinfo1> list = clickinfo1Mapper.ListO(code);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    //分页版本  需要code type offset limit   keyword可选
    public List<Clickinfo1> getClickInfoFenYe(ClickQueryForm form) {
        System.out.println("-----ClickCountImpl endtime:"+form.getEndtime());
        List<Clickinfo1> list = clickinfo1Mapper.listFenYe(form.getCode(), form.getType(), form.getKeyword(), form.getLimit(), form.getOffset(), form.getBrowser(), form.getStarttime(), form.getEndtime());
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    public int countAll(ClickQueryForm form) {
        return clickinfo1Mapper.countAll(form.getKeyword(), form.getCode(), form.getType(), form.getBrowser(), form.getStarttime(), form.getEndtime());
    }

}
