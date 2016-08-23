package cn.xiaohuodui.util;

import cn.xiaohuodui.dao.ClickinfoMapper;
import cn.xiaohuodui.form.ViewsQueryForm;
import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.Shareinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.*;

/**
 * Created by cqxxxxx on 2016/8/19.
 */

@Component
public class ChartDataUtil {

    @Autowired
    ClickinfoMapper clickinfoMapper;

    /**
     * 以click——info表中的日期为模版 作为图标的横坐标  统一四个访问量到一个图表中
     *
     * @param
     * @return
     */
    public Map getOriginMap(ViewsQueryForm vqf) throws ParseException {
        Map<String, Integer> map = new LinkedHashMap<String, Integer>();
        //String code = vqf.getCode();
        Long begin = vqf.getBegin();
        Long end = vqf.getEnd();
        Long size = (end - begin) / (60 * 60 * 24 * 1000);
        //List<Clickinfo> clickinfos = clickinfoMapper.getViews(code, begin, end);
        //Clickinfo theFirst = clickinfos.get(0);
        long unixTime = begin;
        //取第一个最小的日期，把他跟之后6天一共七天放到map的key中，把value置0
        for (int i = 0; i < size; i++) {
            String date = DateUtil.getMMdd(unixTime);  //获取时间MM-dd的形式
            map.put(date, 0);
            unixTime += 60 * 60 * 24 * 1000;
        }
        return map;
    }

    /**
     * 把Clickinfo的list转化为map
     * 把list转为map  key为日期String   value为访问数量
     *
     * @param
     * @return
     */
    public Map clickMapTransfer(Map<String, Integer> map, List<Clickinfo> clickinfos) throws ParseException {

        //判断是否是同一天，是则num+1
        for (Clickinfo clickinfo : clickinfos) {
            String date = DateUtil.getMMdd(clickinfo.getCreated());
            if (map.containsKey(date)) {
                int num = map.get(date);
                map.put(date, num + 1);
            }
        }
        return map;
    }

    /**
     * @param map
     * @param clickinfos
     * @return
     * @throws ParseException
     */
    public Map clickMapTransfer1(Map<String, Integer> map, List<Clickinfo> clickinfos) throws ParseException {
        //判断是否是同一天，是则num+1
        for (Clickinfo clickinfo : clickinfos) {
            String date = DateUtil.getMMdd(clickinfo.getSendTime());
            if (map.containsKey(date)) {
                int num = map.get(date);
                map.put(date, num + 1);
            }
        }
        return map;
    }

    /**
     * @param map
     * @param clickinfos
     * @return
     * @throws ParseException
     */
    public Map clickMapTransfer2(Map<String, Integer> map, List<Clickinfo> clickinfos) throws ParseException {
        //判断是否是同一天，是则num+1
        Map<String, Set<String>> stringSetMap = new HashMap<String, Set<String>>();

        for (Clickinfo clickinfo : clickinfos) {
            Set<String> codeSet = new HashSet<String>();
            String code = clickinfo.getCode();
            String date = DateUtil.getMMdd(clickinfo.getSendTime());
            codeSet.add(code);
            for (Clickinfo clickinfo1 : clickinfos) {
                String date1 = DateUtil.getMMdd(clickinfo1.getSendTime());
                String code1 = clickinfo1.getCode();
                if (date1.equals(date)) {
                    codeSet.add(code1);
                }
            }
            stringSetMap.put(date, codeSet);
        }

        for (String key: stringSetMap.keySet()){
            if (map.containsKey(key)){
                map.put(key, stringSetMap.get(key).size());
            }
        }

        return map;
    }

    /**
     * 把shareinfo的list转化为map
     * 把list转为map  key为日期String   value为访问数量
     *
     * @param
     * @return
     */
    public Map shareMapTransfer(Map<String, Integer> map, List<Shareinfo> shareinfos) throws ParseException {

        //判断是否是同一天，是则num+1
        for (Shareinfo shareinfo : shareinfos) {
            String date = DateUtil.getMMdd(shareinfo.getCreated());
            if (map.containsKey(date)) {
                int num = map.get(date);
                map.put(date, num + 1);
            }
        }
        return map;
    }

    /**
     * @param map
     * @param shareinfos
     * @return
     * @throws ParseException
     */
    public Map shareMapTransfer1(Map<String, Integer> map, List<Shareinfo> shareinfos) throws ParseException {

        //判断是否是同一天，是则num+1
        for (Shareinfo shareinfo : shareinfos) {
            String date = DateUtil.getMMdd(shareinfo.getCheckedTime());
            if (map.containsKey(date)) {
                int num = map.get(date);
                map.put(date, num + 1);
            }
        }
        return map;
    }


}