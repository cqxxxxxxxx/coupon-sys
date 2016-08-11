package cn.xiaohuodui.service.impl;

import cn.xiaohuodui.service.CouponService;
import cn.xiaohuodui.util.SendedUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Service("CouponService")
public class CouponServiceImpl implements CouponService {

    @Autowired
    SendedUtil sendedUtil;



    /**
     * 手机号注册后进行sended的相应的更新
     * @param code
     * @return
     */
    public boolean updateSended(String code) {
        int sended = sendedUtil.getSended(code);
        sended += sendedUtil.getNum(code);
        if (sendedUtil.updateSended(code,sended)>0){
            return true;
        }else {
            return false;
        }
    }

    public boolean checkRemain(String code) {
        return sendedUtil.checkRemain(code);
    }
}
