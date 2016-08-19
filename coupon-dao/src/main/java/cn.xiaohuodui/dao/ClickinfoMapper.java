package cn.xiaohuodui.dao;


import cn.xiaohuodui.model.Clickinfo;
import cn.xiaohuodui.model.IpGroup;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClickinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Clickinfo record);

    int insertSelective(Clickinfo record);

    Clickinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Clickinfo record);

    int updateByPrimaryKey(Clickinfo record);


    //分享信息的分页版本
    List<Clickinfo> listPage(@Param("code") String code, @Param("type") String type, @Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset, @Param("browser") String browser, @Param("starttime") Long starttime, @Param("endtime") Long endtime);

    int countAll(@Param("keyword") String keyword, @Param("code") String code, @Param("type") String type, @Param("browser") String browser, @Param("starttime") Long starttime, @Param("endtime") Long endtime);

    //    按IP进行分组
    List<IpGroup> groupByIp(@Param("offset") int offset, @Param("limit") int limit, @Param("keyword") String keyword);

    //    查询分组数量
    List<IpGroup> countIpAll(@Param("keyword") String keyword);

    //查询独立IP的访问量 code可选 时间限定可选
    List<Clickinfo> getViewsDistinctIp(@Param("code") String code, @Param("begin") Long begin, @Param("end") Long end);

    //查询总的访问量 code可选 时间限定可选
    List<Clickinfo> getViews(@Param("code") String code, @Param("begin") Long begin, @Param("end") Long end);
}