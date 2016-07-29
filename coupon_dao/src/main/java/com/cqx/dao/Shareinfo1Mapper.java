package com.cqx.dao;


import com.cqx.model.Shareinfo1;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface Shareinfo1Mapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shareinfo1 record);

    int insertSelective(Shareinfo1 record);

    Shareinfo1 selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shareinfo1 record);

    int updateByPrimaryKey(Shareinfo1 record);

    //列出个人分享连接所分发出的优惠信息
    List<Shareinfo1> ListP(Map map);

    //列出官方分享连接所分发出的优惠信息
    List<Shareinfo1> ListO(String code);

    //检测手机号是否已经领取过
    List<Shareinfo1> exist(String phone);

    //分页版本 信息查询
    List<Shareinfo1> listFenYe(@Param("code") String code, @Param("type") String type, @Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset, @Param("starttime") String starttime, @Param("endtime") String endtime);

    int countAll(@Param("keyword") String keyword, @Param("code") String code, @Param("type") String type, @Param("starttime") String starttime, @Param("endtime") String endtime);
}