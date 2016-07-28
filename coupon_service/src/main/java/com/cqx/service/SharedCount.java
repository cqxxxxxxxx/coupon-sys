package com.cqx.service;




import com.cqx.form.ShareQueryForm;
import com.cqx.model.Shareinfo1;

import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface SharedCount {

    public boolean setInfo(String code, String phone, String type); //通过个人分享链接得到优惠的人的信息

  //  public boolean setInfo(String code, String phone); //通过官方分享链接得到优惠的人的信息

    public List<Shareinfo1> getShareInfo(Map map);  //通过个人分享得到优惠的点击者信息

    public List<Shareinfo1> getShareInfo(String code);   //通过官方分享得到优惠的点击者信息（官方 type默认0）

    public List<Shareinfo1> getShareInfoFenYe(ShareQueryForm form); //分页版本
}
