package cn.xiaohuodui.util;

import cn.xiaohuodui.util.type.UploadType;
import com.qiniu.api.auth.AuthException;
import com.qiniu.api.rs.PutPolicy;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import com.qiniu.api.auth.digest.Mac;
import javax.annotation.PostConstruct;


import java.io.File;

/**
 * Created by cqxxxxx on 2016/8/4.
 */

@Component
public class FileUtil implements IFileUtil{

    private final static Logger logger = Logger.getLogger(FileUtil.class);
    private final static String IMG_PREFIX = "zhy-img";
    private final static String DEFAULT_PREFIX = "zhy";
   // Mac mac;
    @Value("#{utilSetting['qiniu.host']}")
    private String domain;
    @Value("#{utilSetting['qiniu.access.key']}")
    private String accessKey;
    @Value("#{utilSetting['qiniu.secret.key']}")
    private String secretkey;
    @Value("#{utilSetting['qiniu.bucket']}")
    private String bucket;

/*    @PostConstruct      //在bean初始化前进行的操作
    public void init(){
        mac = new Mac(accessKey,secretkey);
    }*/

    public String uploadFile(MultipartFile file) {
        return uploadFile(file, UploadType.DEAULT);
    }

    /**
     * 生成图片上传的uptoken
     * @param file
     * @return
     */
    public String uploadLocalFile(File file) {
        return null;
    }

    public String getImageUpdateToken() {
        Mac mac = new Mac("cDJh5HiNwt_LsyWQFXGeoGCpdP_BTQ-rvayslUrX","iR116uDldA-TUmVkdcKSft4cpwsC_5iPdBALX-TJ");
        PutPolicy putPolicy = new PutPolicy("jiyingxiaozhan-test");
        String uptoken = null;
        try {
            uptoken = putPolicy.token(mac);
        } catch (AuthException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return uptoken;
    }

    public String uploadFile(MultipartFile file, UploadType type) {
        return null;
    }

    public String getFileUrl(String key, UploadType uploadType) {
        return null;
    }
}
