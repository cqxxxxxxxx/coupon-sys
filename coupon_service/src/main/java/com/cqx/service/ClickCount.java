package com.cqx.service;


import com.cqx.form.ClickQueryForm;
import com.cqx.model.Clickinfo1;

import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ClickCount {

    public void setInfo(String code, String type, String ip, String browser);   //设置个人分享的点击者的信息

   // public void setInfo(String code, String ip, String browser); //官方分享的

    public List<Clickinfo1> getClickInfo(Map map);  //通过个人分享的点击者信息

    public List<Clickinfo1> getClickInfo(String code);   //通过官方分享的点击者信息（官方 type默认0）

    public List<Clickinfo1> getClickInfoFenYe(ClickQueryForm form);

    public int countAll(ClickQueryForm form);

}
