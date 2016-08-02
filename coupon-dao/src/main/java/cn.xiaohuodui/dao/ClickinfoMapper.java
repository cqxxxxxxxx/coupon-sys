package cn.xiaohuodui.dao;



import cn.xiaohuodui.model.Clickinfo;

import cn.xiaohuodui.model.IpGroup;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ClickinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Clickinfo record);

    int insertSelective(Clickinfo record);

    Clickinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Clickinfo record);

    int updateByPrimaryKey(Clickinfo record);

    //个人分享的连接的点击者信息
    List<Clickinfo> ListP(Map map);

    //官方分享的连接的点击者信息
    List<Clickinfo> ListO(String code);

    //分享信息的分页版本
    List<Clickinfo> listFenYe(@Param("code") String code, @Param("type") String type, @Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset, @Param("browser") String browser, @Param("starttime") String starttime, @Param("endtime") String endtime);

    int countAll(@Param("keyword") String keyword, @Param("code") String code, @Param("type") String type, @Param("browser") String browser, @Param("starttime") String starttime, @Param("endtime") String endtime);

//    按IP进行分组
    List<IpGroup> groupByIp(@Param("offset") int offset, @Param("limit") int limit, @Param("keyword") String keyword);

//    查询分组数量
    List<IpGroup> countIpAll(@Param("keyword") String keyword);
}