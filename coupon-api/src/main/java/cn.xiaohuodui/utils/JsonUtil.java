package cn.xiaohuodui.utils;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;

/**
 * Created by cqxxxxx on 2016/7/27.
 */
public class JsonUtil {
    public static String writeObjectAsString(Object object){
        ObjectMapper mapper = new ObjectMapper();
        try{
            return mapper.writeValueAsString(object);
        }catch (IOException e){
            e.printStackTrace();
            return null;
        }
    }
}
