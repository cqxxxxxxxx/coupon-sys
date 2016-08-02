package cn.xiaohuodui.service.impl;

import cn.xiaohuodui.dao.ShareinfoMapper;
import cn.xiaohuodui.form.ShareQueryForm;
import cn.xiaohuodui.model.Shareinfo;
import cn.xiaohuodui.service.ShareService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
@Service("ShareService")
public class ShareServiceImpl implements ShareService {

    @Resource
    private ShareinfoMapper shareinfoMapper;

    private Shareinfo shareinfo;

    private Timestamp ts;

    public boolean setInfo(String code, String phone, String type) {

        shareinfo = new Shareinfo();

        ts = new Timestamp(System.currentTimeMillis());
        shareinfo.setCreated(ts);
        shareinfo.setCode(code);
        shareinfo.setType(type);
        shareinfo.setPhone(phone);
        List<Shareinfo> list = shareinfoMapper.exist(shareinfo);
        if (list.isEmpty()) {
            shareinfoMapper.insert(shareinfo);
            return true;
        } else {
            System.out.println("已经领取过了");
            return false;
        }

    }

    public List<Shareinfo> getShareInfoFenYe(ShareQueryForm form) {
        System.out.println("getphone:"+form.getPhone());
        List<Shareinfo> list = shareinfoMapper.listFenYe(form.getCode(), form.getPhone(), form.getKeyword(), form.getLimit(), form.getOffset(), form.getStarttime(), form.getEndtime());
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    public int countAll(ShareQueryForm form) {
        return shareinfoMapper.countAll( form.getCode(), form.getPhone(),form.getKeyword(), form.getStarttime(), form.getEndtime());
    }
}
