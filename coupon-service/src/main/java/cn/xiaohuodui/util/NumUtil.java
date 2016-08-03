package cn.xiaohuodui.util;

import cn.xiaohuodui.dao.ActivityMapper;
import cn.xiaohuodui.dao.OrganizationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Service("NumUtil")
public class NumUtil {

    @Autowired
    ActivityMapper activityMapper;

    @Autowired
    OrganizationMapper organizationMapper;

    /**
     *
     * @param code
     * @return  返回code对应的活动的num
     */
    public int getNum(String code) {

        if (code.length() == 7) {
            return organizationMapper.getNum(code);
        }else{
            return activityMapper.getNum(code);
        }
    }

}
