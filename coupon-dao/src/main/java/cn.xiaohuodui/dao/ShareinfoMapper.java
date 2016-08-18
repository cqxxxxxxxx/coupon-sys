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
}