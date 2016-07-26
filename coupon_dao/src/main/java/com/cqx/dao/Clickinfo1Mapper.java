package com.cqx.dao;



import com.cqx.model.Clickinfo1;

import java.util.List;
import java.util.Map;

public interface Clickinfo1Mapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Clickinfo1 record);

    int insertSelective(Clickinfo1 record);

    Clickinfo1 selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Clickinfo1 record);

    int updateByPrimaryKey(Clickinfo1 record);

    //个人分享的连接的点击者信息
    List<Clickinfo1> ListP(Map map);

    //官方分享的连接的点击者信息
    List<Clickinfo1> ListO(String code);
}