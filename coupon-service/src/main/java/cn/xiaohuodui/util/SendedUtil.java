package cn.xiaohuodui.util;

import cn.xiaohuodui.dao.ActivityMapper;
import cn.xiaohuodui.dao.OrganizationMapper;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;


/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Component("SendedUtil")
public class SendedUtil {

    @Resource(name = "ActivityMapper")
    ActivityMapper activityMapper;

    @Resource(name = "OrganizationMapper")
    OrganizationMapper organizationMapper;

    /**
     * @param code
     * @return 返回code对应活动的sended数量
     */
    public int getSended(String code) {
        if (organizationMapper.exist(code) != null) {
            return organizationMapper.getSended(code);
        } else {
            return activityMapper.getSended(code);
        }
    }

    public int getTotalLimit(String code) {
        if (organizationMapper.exist(code) != null) {
            return organizationMapper.getTotalLimit(code);
        } else {
            return activityMapper.getTotalLimit(code);
        }
    }

    /**
     * 更新sended
     * @param code
     * @param sended
     * @return
     */
    public int updateSended(String code, int sended) {
        if (organizationMapper.exist(code) != null) {
            return organizationMapper.updateSended(code, sended);
        } else {
            return activityMapper.updateSended(code, sended);
        }
    }

    /**
     * 检查是否还有剩余的优惠券
     * @param code
     * @return
     */
    public boolean checkRemain(String code) {
        if ((this.getTotalLimit(code) - this.getSended(code)) < this.getNum(code)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 获取code对应活动的num即每人领取张数
     * @param code
     * @return
     */
    public int getNum(String code) {
        if (organizationMapper.exist(code) != null) {
            return organizationMapper.getNum(code);
        } else {
            return activityMapper.getNum(code);
        }
    }

}
