package com.cqx.dao;



import com.cqx.model.Activity1;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface Activity1Mapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Activity1 record);

    int insertSelective(Activity1 record);

    Activity1 selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity1 record);

    int updateByPrimaryKeyWithBLOBs(Activity1 record);

    int updateByPrimaryKey(Activity1 record);

    List<Activity1> listAll();

    List<Activity1> exist(String code);

    List<Activity1> listFenYe(@Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset);

    int countAll(@Param("keyword") String keyword);

    int updateActivity(Activity1 record);
}