package com.cqx.service.impl;


import com.cqx.dao.Shareinfo1Mapper;
import com.cqx.model.Shareinfo1;
import com.cqx.service.SharedCount;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
@Service("ShareCount")
public class ShareCountImpl implements SharedCount {

    @Resource
    private Shareinfo1Mapper shareinfo1Mapper;

    private Shareinfo1 shareinfo1;

    private Timestamp ts;

    public boolean setInfo(String code, String phone, String type) {

        shareinfo1 = new Shareinfo1();

        ts = new Timestamp(System.currentTimeMillis());
        shareinfo1.setCreated(ts);

        shareinfo1.setCode(code);
        shareinfo1.setType(type);
        shareinfo1.setPhone(phone);
        List<Shareinfo1> list = shareinfo1Mapper.exist(phone);
        if (list.isEmpty()) {
            shareinfo1Mapper.insert(shareinfo1);
            return true;
        } else {
            System.out.println("已经领取过了");
            return false;
        }

    }

    public boolean setInfo(String code, String phone) {

        shareinfo1 = new Shareinfo1();

        ts = new Timestamp(System.currentTimeMillis());
        shareinfo1.setCreated(ts);

        shareinfo1.setCode(code);
        shareinfo1.setPhone(phone);
        shareinfo1.setType("offical");  //设置成官方
        List<Shareinfo1> list = shareinfo1Mapper.exist(phone);
        if (list.isEmpty()) {
            shareinfo1Mapper.insert(shareinfo1);
            return true;
        } else {
            System.out.println("已经领取过了");
            return false;
        }

    }

    public List<Shareinfo1> getShareInfo(Map map) {
        List<Shareinfo1> list = shareinfo1Mapper.ListP(map);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    public List<Shareinfo1> getShareInfo(String code) {
        List<Shareinfo1> list = shareinfo1Mapper.ListO(code);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    public List<Shareinfo1> getShareInfoFenYe(String code, String type, String keyword, int limit, int offset) {
        List<Shareinfo1> list = shareinfo1Mapper.listFenYe(code, type, keyword, limit, offset);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }
}
