package cn.xiaohuodui.service.impl;

import cn.xiaohuodui.dao.ActivityMapper;
import cn.xiaohuodui.dao.OrganizationMapper;
import cn.xiaohuodui.dao.ShareinfoMapper;
import cn.xiaohuodui.form.PhoneForm;
import cn.xiaohuodui.form.ShareQueryForm;
import cn.xiaohuodui.form.ViewsQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.Shareinfo;
import cn.xiaohuodui.service.ShareService;
import cn.xiaohuodui.util.ChartDataUtil;
import cn.xiaohuodui.util.DateUtil;
import cn.xiaohuodui.util.FormHelper;
import cn.xiaohuodui.vo.InviteVo;
import cn.xiaohuodui.vo.InviteinfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
@Service
public class ShareServiceImpl implements ShareService {

    @Resource
    private ShareinfoMapper shareinfoMapper;

    @Resource
    private OrganizationMapper organizationMapper;

    @Autowired
    ChartDataUtil chartDataUtil;

    @Resource
    private ActivityMapper activityMapper;

    public boolean setInfo(String code, String phone, String type) {

        Shareinfo shareinfo = new Shareinfo();
        shareinfo.setCreated(System.currentTimeMillis());
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

    public List<Shareinfo> getShareInfos(ShareQueryForm form) throws ParseException {
        System.out.println("getphone:" + form.getPhone());
        Long starttime = null;
        Long endtime = null;
        if (form.getStarttime() != null) {
            starttime = DateUtil.stringToTimeStamp(form.getStarttime());
        }
        if (form.getEndtime() != null) {
            endtime = DateUtil.stringToTimeStamp(form.getEndtime());
        }

        List<Shareinfo> list = shareinfoMapper.listPage(form.getCode(), form.getPhone(), form.getKeyword(), form.getLimit(), form.getOffset(), starttime, endtime);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    public int countAll(ShareQueryForm form) throws ParseException {
        Long starttime = null;
        Long endtime = null;
        if (form.getStarttime() != null) {
            starttime = DateUtil.stringToTimeStamp(form.getStarttime());
        }
        if (form.getEndtime() != null) {
            endtime = DateUtil.stringToTimeStamp(form.getEndtime());
        }
        return shareinfoMapper.countAll(form.getCode(), form.getPhone(), form.getKeyword(), starttime, endtime);
    }

    public InviteVo getInviteVoByPhone(String phone) {
        Shareinfo shareinfo = shareinfoMapper.selectByPhone(phone);
        if (shareinfo != null) {
            InviteVo inviteVo = new InviteVo();
            inviteVo.setPhone(phone);
            inviteVo.setRef(shareinfo.getCode());
            inviteVo.setCreated(shareinfo.getCreated());

            return inviteVo;
        } else {
            return new InviteVo();
        }
    }

    public InviteinfoVo getInviteinfoVoByPhone(String phone) {
        Shareinfo shareinfo = shareinfoMapper.selectByPhone(phone);
        InviteinfoVo inviteinfoVo = new InviteinfoVo();
        if (shareinfo != null) {
            inviteinfoVo.setPhone(phone);
            inviteinfoVo.setRef(shareinfo.getCode());
            inviteinfoVo.setType(shareinfo.getType());
            inviteinfoVo.setCreated(shareinfo.getCreated());
            if (shareinfo.getCode().length() == 7) {
                inviteinfoVo.setNum(organizationMapper.getNum(shareinfo.getCode()));
            } else if (shareinfo.getCode().length() == 8) {
                inviteinfoVo.setNum(activityMapper.getNum(shareinfo.getCode()));
            } else {
                inviteinfoVo.setNum(0);
            }
            return inviteinfoVo;
        } else {
            return inviteinfoVo;
        }
    }

    /**
     * 反馈该 手机号分享已经 注册了
     *
     * @param phoneForm
     */
    public void markReg(PhoneForm phoneForm) {
        Shareinfo shareinfo = shareinfoMapper.selectByPhone(phoneForm.getPhone());
        if (shareinfo != null) {
            shareinfo.setChecked(1);
            shareinfo.setCheckedTime(System.currentTimeMillis());

            shareinfoMapper.updateByPrimaryKey(shareinfo);
        }
    }

    /**
     * 查询填了手机号的数量
     * @param viewsQueryForm
     * @return key为日期，全部统一   value为数量
     * @throws ParseException
     */
    public Map getRegistrations(ViewsQueryForm viewsQueryForm) throws ParseException {
        ViewsQueryForm vqf = FormHelper.validateViewsQueryForm(viewsQueryForm);
        String code = vqf.getCode();
        Long begin = vqf.getBegin();
        Long end = vqf.getEnd();
        List<Shareinfo> shareinfos = shareinfoMapper.getRegistrations(code, begin, end);
        Map originMap = chartDataUtil.getOriginMap(vqf);
        return chartDataUtil.shareMapTransfer(originMap, shareinfos);
    }

    /**
     * 查询APP上注册了的数量
     * @param viewsQueryForm
     * @return key为日期，全都统一， value为数量
     * @throws ParseException
     */
    public Map getAppRegistrations(ViewsQueryForm viewsQueryForm) throws ParseException {
        ViewsQueryForm vqf = FormHelper.validateViewsQueryForm(viewsQueryForm);
        String code = vqf.getCode();
        Long begin = vqf.getBegin();
        Long end = vqf.getEnd();
        List<Shareinfo> shareinfos = shareinfoMapper.getAppRegistrations(code, begin, end);
        Map originMap = chartDataUtil.getOriginMap(vqf);
        return chartDataUtil.shareMapTransfer1(originMap, shareinfos);

    }



/*    *//**
     * 把list转为map  key为日期String   value为数量int
     * @param shareinfos
     * @return
     *//*
    public Map mapTransfer(List<Shareinfo> shareinfos){
        Map<String, Integer> map = new LinkedHashMap<String, Integer>();
        Shareinfo theFirst = shareinfos.get(0);
        long unixTime = theFirst.getCreated();

        //取第一个最小的日期，把他跟之后6天一共七天放到map的key中
        for(int i=0; i<7; i++){
            String date = DateUtil.getMMdd(unixTime);  //获取时间MM-dd的形式
            map.put(date, 0);
            unixTime += 60 * 60 * 24 * 1000;
        }
        for (Shareinfo shareinfo: shareinfos){
            String date = DateUtil.getMMdd(shareinfo.getCreated());
            if (map.containsKey(date)){
                int num = map.get(date);
                map.put(date, num + 1);
            }
        }
        return map;
    }*/

}
