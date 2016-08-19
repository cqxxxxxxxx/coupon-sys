package cn.xiaohuodui.dao;

import cn.xiaohuodui.model.Shareinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShareinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shareinfo record);

    int insertSelective(Shareinfo record);

    Shareinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shareinfo record);

    int updateByPrimaryKey(Shareinfo record);

    //检测手机号是否已经领取过
    List<Shareinfo> exist(Shareinfo shareinfo);

    //分页版本 信息查询
    List<Shareinfo> listPage(@Param("code") String code, @Param("phone") String phone, @Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset, @Param("starttime") Long starttime, @Param("endtime") Long endtime);

    int countAll(@Param("code") String code, @Param("phone") String phone, @Param("keyword") String keyword, @Param("starttime") Long starttime, @Param("endtime") Long endtime);

    Shareinfo selectByPhone(@Param("phone") String phone);

    //查询指定code下注册数量 时间限定可选
    List<Shareinfo> getRegistrations(@Param("code") String code, @Param("begin") Long begin, @Param("end") Long end);

    //查询指定code下填过手机号且APP上注册过的数量，即字段checked=1 时间限定可选
    List<Shareinfo> getAppRegistrations(@Param("code") String code, @Param("begin") Long begin, @Param("end") Long end);
}