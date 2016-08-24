package cn.xiaohuodui.dao;

import cn.xiaohuodui.model.Intermediate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IntermediateMapper {

    int insert(Intermediate record);

    int updateByPrimaryKey(Intermediate record);

    /**
     * @param name (6种类型,notNull)
     * @param code code(Null则代表所有活动访问量之和)
     * @param begin 开始日期
     * @param end   结束日期
     * @return
     */
    List<Intermediate> selectByNameCodeDate(@Param("name") String name, @Param("code") String code, @Param("begin") String begin, @Param("end") String end);
}