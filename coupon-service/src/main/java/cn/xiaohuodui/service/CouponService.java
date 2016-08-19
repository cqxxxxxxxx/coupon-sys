package cn.xiaohuodui.service;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
public interface CouponService {

     boolean updateSended(String code);

     boolean checkRemain(String code);
}
