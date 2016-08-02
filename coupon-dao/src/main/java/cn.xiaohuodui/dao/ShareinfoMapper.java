package cn.xiaohuodui.dao;



import cn.xiaohuodui.model.Shareinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ShareinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shareinfo record);

    int insertSelective(Shareinfo record);

    Shareinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shareinfo record);

    int updateByPrimaryKey(Shareinfo record);

    //列出个人分享连接所分发出的优惠信息
    List<Shareinfo> ListP(Map map);

    //列出官方分享连接所分发出的优惠信息
    List<Shareinfo> ListO(String code);

    //检测手机号是否已经领取过
    List<Shareinfo> exist(Shareinfo shareinfo);

    //分页版本 信息查询
    List<Shareinfo> listFenYe(@Param("code") String code, @Param("phone") String phone, @Param("keyword") String keyword, @Param("limit") int limit, @Param("offset") int offset, @Param("starttime") String starttime, @Param("endtime") String endtime);

    int countAll( @Param("code") String code, @Param("phone") String phone,@Param("keyword") String keyword, @Param("starttime") String starttime, @Param("endtime") String endtime);
}