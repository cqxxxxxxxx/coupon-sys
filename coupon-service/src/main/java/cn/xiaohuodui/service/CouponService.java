package cn.xiaohuodui.service;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
public interface CouponService {

    public boolean updateSended(String code);

    public boolean checkRemain(String code);
}
