package cn.xiaohuodui.service;


import cn.xiaohuodui.form.ClickQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.IpGroup;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ClickService {

    public void setInfo(String code, String ip, String browser);   //设置个人分享的点击者的信息

    public List<Clickinfo> getClickInfos(ClickQueryForm form) throws ParseException;

    public int countAll(ClickQueryForm form) throws ParseException;

    public List<IpGroup> getIpGroup(int offset, int limit, String keyword);

    public int countAllIpGroup(String keyword);

}
