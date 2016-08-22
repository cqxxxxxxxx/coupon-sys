package cn.xiaohuodui.service;


import cn.xiaohuodui.form.ClickQueryForm;
import cn.xiaohuodui.form.ViewsQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.IpGroup;

import javax.swing.text.View;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ClickService {

     void setInfo(String code, String ip, String browser, Long timestamp);   //设置个人分享的点击者的信息

     List<Clickinfo> getClickInfos(ClickQueryForm form) throws ParseException;

     int countAll(ClickQueryForm form) throws ParseException;

     List<IpGroup> getIpGroup(int offset, int limit, String keyword);

     int countAllIpGroup(String keyword);

     Map getViewsDistinctIp(ViewsQueryForm viewsQueryForm) throws ParseException;

     Map getViews(ViewsQueryForm viewsQueryForm) throws ParseException;

     Map getPersonalInvites(ViewsQueryForm viewsQueryForm) throws ParseException;

     Map getDistinctPersonalInvites(ViewsQueryForm viewsQueryForm) throws ParseException;


}
