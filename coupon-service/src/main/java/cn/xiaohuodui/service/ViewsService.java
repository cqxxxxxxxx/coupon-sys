package cn.xiaohuodui.service;

import cn.xiaohuodui.form.ViewsQueryForm;
import cn.xiaohuodui.model.Intermediate;

import java.text.ParseException;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/8/24.
 */
public interface ViewsService {

    void insert(Intermediate intermediate);

    Map getNeededViews(ViewsQueryForm viewsQueryForm) throws ParseException;
}
