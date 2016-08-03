package cn.xiaohuodui.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
public class DateUtil {

    public static long stringToTimeStamp(String strDate) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = simpleDateFormat.parse(strDate);
        return date.getTime();
    }

    public static String timeStampToString(long timeStamp) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(timeStamp);
        return simpleDateFormat.format(date);
    }


    public static void main(String[] args) {
        String strDate = "2016-11-04";
        try {
            System.out.println(DateUtil.stringToTimeStamp(strDate));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(DateUtil.timeStampToString(System.currentTimeMillis()));

    }
}
