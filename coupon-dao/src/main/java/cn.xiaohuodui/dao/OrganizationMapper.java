package cn.xiaohuodui.dao;

import cn.xiaohuodui.model.Organization;
import org.apache.ibatis.annotations.Param;
import org.aspectj.weaver.ast.Or;

import java.util.List;

public interface OrganizationMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKeyWithBLOBs(Organization record);

    int updateByPrimaryKey(Organization record);

    String exist(String code);

    int insert(Organization record);

    List<Organization> listPage(@Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset);

    int countAll(@Param("keyword") String keyword);

    int getNum(@Param("code") String code);

    int getSended(@Param("code") String code);

    int updateSended(@Param("code") String code, @Param("sended") int sended);

    long getEndtime(@Param("code") String code);

    long getStarttime(@Param("code") String code);

    Organization getInfo(@Param("code") String code);

    int updateInfo(Organization organization);

    int deleteOrganization(@Param("code") String code);

    int getTotalLimit(@Param("code") String code);
}