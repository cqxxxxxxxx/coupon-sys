package cn.xiaohuodui.service.impl;


import cn.xiaohuodui.dao.ClickinfoMapper;
import cn.xiaohuodui.form.ClickQueryForm;
import cn.xiaohuodui.form.ViewsQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.IpGroup;
import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.service.ClickService;
import cn.xiaohuodui.util.ChartDataUtil;
import cn.xiaohuodui.util.DateUtil;
import cn.xiaohuodui.util.FormHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
@Service("ClickService")
public class ClickServiceImpl implements ClickService {

    @Resource
    private ClickinfoMapper clickinfoMapper;

    @Autowired
    ChartDataUtil chartDataUtil;


    @Autowired
    private ActivityService activityService;

    //官方分享的URL被点击后  把点击者信息插入clickinfo表
    public void setInfo(String code, String ip, String browser, Long timestamp) {
        Clickinfo clickinfo = new Clickinfo();

        if (code.length() == 6) {
            clickinfo.setType("1");                     //来自个人code type1
        } else if (!activityService.checkCode(code)) {
            clickinfo.setType("0");                     //来自官方的code， TYPE为0
        } else {
            clickinfo.setType("2");                     //来自企业code， TYPE2
        }
        clickinfo.setSendTime(timestamp);
        clickinfo.setCreated(System.currentTimeMillis());
        clickinfo.setBrowser(browser);
        clickinfo.setCode(code);
        clickinfo.setIp(ip);

        if (clickinfoMapper.insert(clickinfo) != 0) {
            System.out.println("插入成功");
        } else
            System.out.println("插入失败");
    }


    //分页版本  需要code type offset limit   keyword可选
    public List<Clickinfo> getClickInfos(ClickQueryForm form) throws ParseException {
        System.out.println("-----ClickServiceImpl endtime:" + form.getEndtime());
        Long starttime = null;
        Long endtime = null;
        if (form.getStarttime() != null) {
            starttime = DateUtil.stringToTimeStamp(form.getStarttime());
        }
        if (form.getEndtime() != null) {
            endtime = DateUtil.stringToTimeStamp(form.getEndtime());
        }

        List<Clickinfo> list = clickinfoMapper.listPage(form.getCode(), form.getType(), form.getKeyword(), form.getLimit(), form.getOffset(), form.getBrowser(), starttime, endtime);
        if (list == null) {
            System.out.println("获取失败");
            return null;
        } else {
            System.out.println("获取成功");
            return list;
        }
    }

    public int countAll(ClickQueryForm form) throws ParseException {
        Long starttime = null;
        Long endtime = null;
        if (form.getStarttime() != null) {
            starttime = DateUtil.stringToTimeStamp(form.getStarttime());
        }
        if (form.getEndtime() != null) {
            endtime = DateUtil.stringToTimeStamp(form.getEndtime());
        }
        return clickinfoMapper.countAll(form.getKeyword(), form.getCode(), form.getType(), form.getBrowser(), starttime, endtime);
    }

    public List<IpGroup> getIpGroup(int offset, int limit, String keyword) {

        return clickinfoMapper.groupByIp(offset, limit, keyword);

    }

    public int countAllIpGroup(String keyword) {
        List<IpGroup> list = clickinfoMapper.countIpAll(keyword);
        return list.size();
    }


    /**
     * 查询独立IP的访问量  code可选
     *
     * @param viewsQueryForm
     * @return key为日期  value为当天访问量
     */
    public Map getViewsDistinctIp(ViewsQueryForm viewsQueryForm) throws ParseException {
        ViewsQueryForm vqf = FormHelper.validateViewsQueryForm(viewsQueryForm);
        String code = vqf.getCode();
        Long begin = vqf.getBegin();
        Long end = vqf.getEnd();
        List<Clickinfo> clickinfos = clickinfoMapper.getViewsDistinctIp(code, begin, end);
        Map originMap = chartDataUtil.getOriginMap(vqf);
        return chartDataUtil.clickMapTransfer(originMap, clickinfos);
    }

    /**
     * 查询总的访问量  code可选
     *
     * @param viewsQueryForm
     * @return key为日期  value为当天访问量
     */
    public Map getViews(ViewsQueryForm viewsQueryForm) throws ParseException {
        ViewsQueryForm vqf = FormHelper.validateViewsQueryForm(viewsQueryForm);
        String code = vqf.getCode();
        Long begin = vqf.getBegin();
        Long end = vqf.getEnd();
        List<Clickinfo> clickinfos = clickinfoMapper.getViews(code, begin, end);
        Map originMap = chartDataUtil.getOriginMap(vqf);
        return chartDataUtil.clickMapTransfer(originMap, clickinfos);
    }

    /**
     * 查询每天有几个人分享，即一个人多次分享链接也只算一个
     *
     * @param viewsQueryForm
     * @return
     * @throws ParseException
     */
    public Map getPersonalInvites(ViewsQueryForm viewsQueryForm) throws ParseException {
        ViewsQueryForm vqf = FormHelper.validateViewsQueryForm(viewsQueryForm);
        String code = vqf.getCode();
        Long begin = vqf.getBegin();
        Long end = vqf.getEnd();
        List<Clickinfo> clickinfos = clickinfoMapper.getPersonalInvites(code, begin, end);
        Map originMap = chartDataUtil.getOriginMap(vqf);
        return chartDataUtil.clickMapTransfer(originMap, clickinfos);
    }

    /**
     * 查询每天个人分享的链接数，即一个人多次分享链接也以多次计算
     *
     * @param viewsQueryForm
     * @return
     * @throws ParseException
     */
    public Map getDistinctPersonalInvites(ViewsQueryForm viewsQueryForm) throws ParseException {
        ViewsQueryForm vqf = FormHelper.validateViewsQueryForm(viewsQueryForm);
        String code = vqf.getCode();
        Long begin = vqf.getBegin();
        Long end = vqf.getEnd();
        List<Clickinfo> clickinfos = clickinfoMapper.getDistinctPersonalInvites(code, begin, end);
        Map originMap = chartDataUtil.getOriginMap(vqf);
        return chartDataUtil.clickMapTransfer(originMap, clickinfos);
    }


/*
    */
/**
 * 把list转为map  key为日期String   value为数量int
 * @param clickinfos
 * @return
 *//*

    public Map mapTransfer(List<Clickinfo> clickinfos){

        Map<String, Integer> map = new ChartDataUtil().getOriginMap(clickinfos);

        //判断是否是同一天，是则num+1
        for (Clickinfo clickinfo: clickinfos){
            String date = DateUtil.getMMdd(clickinfo.getCreated());
            if (map.containsKey(date)){
                int num = map.get(date);
                map.put(date, num + 1);
            }
        }
        return map;
    }
*/


}
