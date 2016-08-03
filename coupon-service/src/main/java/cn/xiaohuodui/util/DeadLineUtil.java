package cn.xiaohuodui.util;

import cn.xiaohuodui.dao.ActivityMapper;
import cn.xiaohuodui.dao.OrganizationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Service("DeadLineUtil")
public class DeadLineUtil {

    @Resource(name="ActivityMapper")
    ActivityMapper activityMapper;

    @Resource(name="OrganizationMapper")
    OrganizationMapper organizationMapper;

    /**
     * 获取code对应的活动开始时间
     * @param code
     * @return
     */
    public long getStarttime(String code){
        if (code.length() == 7) {
            return organizationMapper.getStarttime(code);
        }else {
            return activityMapper.getStarttime(code);
        }
    }

    /**
     * 获得code对应的活动的结束时间
     * @param code
     * @return
     */
    public long getEndtime(String code){
        if (code.length() == 7) {
            return organizationMapper.getEndtime(code);
        }else {
            return activityMapper.getEndtime(code);
        }
    }
}
