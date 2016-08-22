package cn.xiaohuodui.util;

import cn.xiaohuodui.form.ViewsQueryForm;

import java.text.ParseException;
import java.util.Date;

/**
 * Created by cqxxxxx on 2016/8/18.
 */
public class FormHelper {

    /**
     * 根据传进来开始和结束日期是否填写来设置开始和结束日期
     *
     * @param viewsQueryForm
     * @return
     * @throws ParseException
     */
    public static ViewsQueryForm validateViewsQueryForm(ViewsQueryForm viewsQueryForm) throws ParseException {
        Long beginDate = viewsQueryForm.getBegin();
        Long endDate = viewsQueryForm.getEnd();
        if (beginDate == null && endDate != null) {  //开始日期没填，结束日期填了，则开始日期设为结束日期-7天
            endDate = endDate + 60 * 60 * 24 * 1000;
            beginDate = endDate - 60 * 60 * 24 * 7 * 1000;
            viewsQueryForm.setBegin(beginDate);
            viewsQueryForm.setEnd(endDate);
            return viewsQueryForm;
        } else if (endDate == null && beginDate != null) { //结束日期没填，开始日期填了，则结束日期设为开始日期+7天
            //beginDate = beginDate - 60 * 60 * 24 * 1000;
            endDate = beginDate + 60 * 60 * 24 * 7 * 1000;
            viewsQueryForm.setBegin(beginDate);
            viewsQueryForm.setEnd(endDate);
            return viewsQueryForm;
        } else if (beginDate == null && endDate == null) { //如果两者都没填，则设结束日期为今天,开始日期为前7天
            Long today = new Date().getTime();
            endDate = DateUtil.stringToTimeStamp(DateUtil.timeStampToString(today)) + 60 * 60 * 24 * 1000;  //去除时分秒
            beginDate = endDate - 60 * 60 * 24 * 7 * 1000;
            viewsQueryForm.setBegin(beginDate);
            viewsQueryForm.setEnd(endDate);
            return viewsQueryForm;
        } else {
            endDate = endDate + 60 * 60 * 24 * 1000;
            viewsQueryForm.setBegin(beginDate);
            viewsQueryForm.setEnd(endDate);
            return viewsQueryForm;
        }
    }

}

