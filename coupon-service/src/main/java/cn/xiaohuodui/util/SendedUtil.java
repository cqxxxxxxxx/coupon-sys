package cn.xiaohuodui.util;

import cn.xiaohuodui.dao.ActivityMapper;
import cn.xiaohuodui.dao.OrganizationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Service("SendedUtil")
public class SendedUtil {

    @Resource(name="ActivityMapper")
    ActivityMapper activityMapper;

    @Resource(name="OrganizationMapper")
    OrganizationMapper organizationMapper;

    /**
     * @param code
     * @return 返回code对应活动的sended数量
     */
    public int getSended(String code) {
        if (code.length() == 7) {
            return organizationMapper.getSended(code);
        } else {
            return activityMapper.getSended(code);
        }
    }

    /**
     * @param code
     * @param sended
     * @return
     */
    public int updateSended(String code, int sended) {
        if (code.length() == 7) {
            return organizationMapper.updateSended(code, sended);
        } else {
            return activityMapper.updateSended(code, sended);
        }
    }
}
