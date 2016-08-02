package cn.xiaohuodui.dao;



import cn.xiaohuodui.model.Activity;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKeyWithBLOBs(Activity record);

    int updateByPrimaryKey(Activity record);

    Activity selectByCode(String code);

    List<Activity> listAll();

    List<Activity> exist(String code);

    List<Activity> listFenYe(@Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset);

    int countAll(@Param("keyword") String keyword);

    int updateActivity(Activity record);
}