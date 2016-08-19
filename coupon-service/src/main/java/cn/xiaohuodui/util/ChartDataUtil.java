package cn.xiaohuodui.util;

import cn.xiaohuodui.dao.ClickinfoMapper;
import cn.xiaohuodui.model.Clickinfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/8/19.
 */
public class ChartDataUtil {




    /**
     * 以click——info表中的日期为模版 作为图标的横坐标
     *
     * @param clickinfos
     * @return
     */
    public Map getOriginMap(List<Clickinfo> clickinfos) {
        Map<String, Integer> map = new LinkedHashMap<String, Integer>();
        Clickinfo theFirst = clickinfos.get(0);
        long unixTime = theFirst.getCreated();

        //取第一个最小的日期，把他跟之后6天一共七天放到map的key中，把value置0
        for (int i = 0; i < 7; i++) {
            String date = DateUtil.getMMdd(unixTime);  //获取时间MM-dd的形式
            map.put(date, 0);
            unixTime += 60 * 60 * 24 * 1000;
        }
        return map;
    }



}
