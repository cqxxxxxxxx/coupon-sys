package cn.xiaohuodui.service.impl;

import cn.xiaohuodui.dao.IntermediateMapper;
import cn.xiaohuodui.form.ViewsQueryForm;
import cn.xiaohuodui.model.Intermediate;
import cn.xiaohuodui.service.ViewsService;
import cn.xiaohuodui.util.ChartDataUtil;
import cn.xiaohuodui.util.DateUtil;
import cn.xiaohuodui.util.FormHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * 从中间表中查找需要的数据，或者插入数据
 * Created by cqxxxxx on 2016/8/24.
 */
@Service
public class ViewsServiceImpl implements ViewsService {

    @Autowired
    ChartDataUtil chartDataUtil;

    @Autowired
    IntermediateMapper intermediateMapper;

    public void insert(Intermediate intermediate) {

    }

    public Map getNeededViews(ViewsQueryForm viewsQueryForm) throws ParseException {
        ViewsQueryForm vqf = FormHelper.validateViewsQueryForm(viewsQueryForm);
        String begin = DateUtil.timeStampToString(vqf.getBegin());  //yyyy-MM-dd格式
        String end = DateUtil.timeStampToString(vqf.getEnd());      //yyyy-MM-dd格式
        String name = vqf.getName();
        Map originMap = chartDataUtil.getOriginMap(vqf);
        List<Intermediate> intermediates = intermediateMapper.selectByNameCodeDate(name, viewsQueryForm.getCode(), begin, end);
        return chartDataUtil.IntermediateMapTransfer(originMap, intermediates);
    }
}
