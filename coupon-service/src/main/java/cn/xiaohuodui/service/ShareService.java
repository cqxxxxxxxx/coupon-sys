package cn.xiaohuodui.service;


import cn.xiaohuodui.form.ShareQueryForm;
import cn.xiaohuodui.model.Shareinfo;
import cn.xiaohuodui.vo.InviteVo;
import cn.xiaohuodui.vo.InviteinfoVo;

import java.text.ParseException;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface ShareService {

    public boolean setInfo(String code, String phone, String type); //通过个人分享链接得到优惠的人的信息

    public List<Shareinfo> getShareInfos(ShareQueryForm form) throws ParseException; //分页版本

    public int countAll(ShareQueryForm form) throws ParseException;

    /**
     * 通过手机号 查询 邀请来源
     *
     * @param phone 要注册的手机号
     * @return
     */
    public InviteVo getInviteVoByPhone(String phone);

    public InviteinfoVo getInviteinfoVoByPhone(String phone);
}
