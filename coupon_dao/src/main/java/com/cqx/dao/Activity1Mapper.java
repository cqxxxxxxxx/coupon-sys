package com.cqx.dao;



import com.cqx.model.Activity1;

import java.util.List;

public interface Activity1Mapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Activity1 record);

    int insertSelective(Activity1 record);

    Activity1 selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity1 record);

    int updateByPrimaryKeyWithBLOBs(Activity1 record);

    int updateByPrimaryKey(Activity1 record);

    List<Activity1> listAll();
}