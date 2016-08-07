package cn.xiaohuodui.dao;

import cn.xiaohuodui.model.Activity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKeyWithBLOBs(Activity record);

    int updateByPrimaryKey(Activity record);



    int insert(Activity record);

//判断code是否存在
    List<Activity> exist(String code);

    List<Activity> listPage(@Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset);

    int countAll(@Param("keyword") String keyword);

    int updateActivity(Activity record);

    Activity selectByCode(String code);

    int getNum(@Param("code") String code);

    int getSended(@Param("code") String code);

    int updateSended(@Param("code") String code, @Param("sended") int sended);

    long getEndtime(@Param("code") String code);

    long getStarttime(@Param("code") String code);

    int getTotalLimit(@Param("code") String code);

    int deleteActivity(@Param("code") String code);
}