package cn.xiaohuodui.service;


import cn.xiaohuodui.form.PhoneForm;
import cn.xiaohuodui.form.ShareQueryForm;
import cn.xiaohuodui.form.ViewsQueryForm;
import cn.xiaohuodui.model.Shareinfo;
import cn.xiaohuodui.vo.InviteVo;
import cn.xiaohuodui.vo.InviteinfoVo;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ShareService {

    boolean setInfo(String code, String phone, String type); //通过个人分享链接得到优惠的人的信息

    List<Shareinfo> getShareInfos(ShareQueryForm form) throws ParseException; //分页版本

    int countAll(ShareQueryForm form) throws ParseException;

    /**
     * 通过手机号 查询 邀请来源
     *
     * @param phone 要注册的手机号
     * @return
     */
    InviteVo getInviteVoByPhone(String phone);

    InviteinfoVo getInviteinfoVoByPhone(String phone);

    void markReg(PhoneForm phoneForm);

    Map<String, Integer> getRegistrations(ViewsQueryForm viewsQueryForm) throws ParseException;

    Map<String, Integer> getAppRegistrations(ViewsQueryForm viewsQueryForm) throws ParseException;
}
