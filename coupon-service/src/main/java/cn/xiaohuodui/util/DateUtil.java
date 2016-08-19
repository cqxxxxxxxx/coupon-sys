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

    public static String getMMdd(long timeStamp) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM-dd");
        Date date = new Date(timeStamp);
        return simpleDateFormat.format(date);
    }


    public static void main(String[] args) {


            System.out.println(DateUtil.getMMdd(System.currentTimeMillis()));


    }
}
