package cn.xiaohuodui.dao;

import cn.xiaohuodui.model.Organization;
import org.apache.ibatis.annotations.Param;

public interface OrganizationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Organization record);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKeyWithBLOBs(Organization record);

    int updateByPrimaryKey(Organization record);

    int getNum(@Param("code") String code);

    int getSended(@Param("code") String code);

    int updateSended(@Param("code") String code, @Param("sended") int sended);

    long getEndtime(@Param("code") String code);

    long getStarttime(@Param("code") String code);
}