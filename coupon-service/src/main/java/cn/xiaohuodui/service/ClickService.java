package cn.xiaohuodui.service;


import cn.xiaohuodui.form.ClickQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.IpGroup;

import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ClickService {

    public void setInfo(String code, String ip, String browser);   //设置个人分享的点击者的信息

   // public void setInfo(String code, String ip, String browser); //官方分享的

    public List<Clickinfo> getClickInfo(Map map);  //通过个人分享的点击者信息

    public List<Clickinfo> getClickInfo(String code);   //通过官方分享的点击者信息（官方 type默认0）

    public List<Clickinfo> getClickInfoFenYe(ClickQueryForm form);

    public int countAll(ClickQueryForm form);

    public List<IpGroup> getIpGroupFenYe(int offset, int limit, String keyword);

    public int countAllIpGroup(String keyword);

}
