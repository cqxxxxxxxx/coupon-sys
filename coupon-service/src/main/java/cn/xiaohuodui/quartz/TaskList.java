package cn.xiaohuodui.quartz;


import cn.xiaohuodui.dao.ClickinfoMapper;
import cn.xiaohuodui.dao.IntermediateMapper;
import cn.xiaohuodui.dao.ShareinfoMapper;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.Intermediate;
import cn.xiaohuodui.model.Shareinfo;
import cn.xiaohuodui.util.DateUtil;
import cn.xiaohuodui.util.type.ViewsType;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.util.*;

/**
 * Created by cqxxxxx on 2016/8/24.
 */
public class TaskList {

    private final Logger logger = Logger.getLogger(TaskList.class);
    public static long ONE_DAY = 1000L * 60 * 60 * 24;

    @Autowired
    ClickinfoMapper clickinfoMapper;
    @Autowired
    ShareinfoMapper shareinfoMapper;
    @Autowired
    IntermediateMapper intermediateMapper;


    public void setInfos() throws ParseException {
        int num;
        Date date = new Date();
        Intermediate intermediate = new Intermediate();
        String today = DateUtil.timeStampToString(date.getTime());  //yyyy-MM-dd格式
        intermediate.setDate(today);
        Long begin = DateUtil.stringToTimeStamp(today);
        Long end = begin + ONE_DAY;

        //全部的活动访问量总和  code为null
        {
            //总访问量
            num = clickinfoMapper.getViews(null, begin, end).size();
            intermediate.setName(ViewsType.VIEWS.getValue());
            intermediate.setNum(num);
            intermediateMapper.insert(intermediate);

            //独立访问量
            num = clickinfoMapper.getViewsDistinctIp(null, begin, end).size();
            intermediate.setName(ViewsType.DVIEWS.getValue());
            intermediate.setNum(num);
            intermediateMapper.insert(intermediate);

            //注册数
            num = shareinfoMapper.getRegistrations(null, begin, end).size();
            intermediate.setName(ViewsType.REGISTRATIONS.getValue());
            intermediate.setNum(num);
            intermediateMapper.insert(intermediate);

            //APP注册数量
            num = shareinfoMapper.getAppRegistrations(null, begin, end).size();
            intermediate.setName(ViewsType.APPREGISTRATIONS.getValue());
            intermediate.setNum(num);
            intermediateMapper.insert(intermediate);

            //分享者数
            num = clickinfoMapper.getPersonalInvites(null, begin, end).size();
            intermediate.setName(ViewsType.PINVITES.getValue());
            intermediate.setNum(num);
            intermediateMapper.insert(intermediate);

            //分享数
            num = clickinfoMapper.getDistinctPersonalInvites(null, begin, end).size();
            intermediate.setName(ViewsType.DPINVITES.getValue());
            intermediate.setNum(num);
            intermediateMapper.insert(intermediate);
        }



        //循环遍历code 对不同活动的访问量进行插入
        {

/*--------------------------根据click表中created查询----------------------------------------------------------------------------------*/

            List<Clickinfo> clickinfos = clickinfoMapper.getViews(null, begin, end);
            Set<String> codes = new HashSet<String>();
            for (Clickinfo clickinfo : clickinfos){
                codes.add(clickinfo.getCode());
            }

            //遍历循环插入不同活动的访问量
            intermediate.setName(ViewsType.VIEWS.getValue());
            for (String code : codes){
                num = clickinfoMapper.getViews(code, begin, end).size();
                intermediate.setNum(num);
                intermediate.setCode(code);
                intermediateMapper.insert(intermediate);
            }

            //遍历循环插入不同活动的独立访问量
            intermediate.setName(ViewsType.DVIEWS.getValue());
            for (String code : codes){
                num = clickinfoMapper.getViewsDistinctIp(code, begin, end).size();
                intermediate.setNum(num);
                intermediate.setCode(code);
                intermediateMapper.insert(intermediate);
            }


/*--------------------根据share表中created查询---因为根据查询的date字段不同，所以code也不一定一样，需要重新获取----------------------------------------------------------------*/
            codes.clear();
            List<Shareinfo> shareinfos = shareinfoMapper.getRegistrations(null, begin, end);
            for (Shareinfo shareinfo : shareinfos){
                codes.add(shareinfo.getCode());
            }
            //遍历循环插入不同活动的注册数
            intermediate.setName(ViewsType.REGISTRATIONS.getValue());
            for (String code : codes){
                num = shareinfoMapper.getRegistrations(code, begin, end).size();
                intermediate.setNum(num);
                intermediate.setCode(code);
                intermediateMapper.insert(intermediate);
            }



/*--------------------------根据share表中checkedtime查询----------------------------------------------------------------------------------*/
            codes.clear();
            shareinfos = shareinfoMapper.getAppRegistrations(null, begin, end);
            for (Shareinfo shareinfo : shareinfos){
                codes.add(shareinfo.getCode());
            }
            //遍历循环插入不同活动的APP注册数
            intermediate.setName(ViewsType.APPREGISTRATIONS.getValue());
            for (String code : codes){
                num = shareinfoMapper.getAppRegistrations(code, begin, end).size();
                intermediate.setNum(num);
                intermediate.setCode(code);
                intermediateMapper.insert(intermediate);
            }




/*------------------------------根据clickinfo表中sendtime查询------------------------------------------------------------------------------*/
            codes.clear();
            clickinfos = clickinfoMapper.getPersonalInvites(null, begin, end);
            for (Clickinfo clickinfo : clickinfos){
                codes.add(clickinfo.getCode());
            }

            //遍历循环插入不同活动的分享者数
            intermediate.setName(ViewsType.PINVITES.getValue());
            for (String code : codes){
                num = clickinfoMapper.getPersonalInvites(code, begin, end).size();
                intermediate.setNum(num);
                intermediate.setCode(code);
                intermediateMapper.insert(intermediate);
            }

            //遍历循环插入不同活动的分享数
            intermediate.setName(ViewsType.DPINVITES.getValue());
            for (String code : codes){
                num = clickinfoMapper.getDistinctPersonalInvites(code, begin, end).size();
                intermediate.setNum(num);
                intermediate.setCode(code);
                intermediateMapper.insert(intermediate);
            }
        }


    }


}
