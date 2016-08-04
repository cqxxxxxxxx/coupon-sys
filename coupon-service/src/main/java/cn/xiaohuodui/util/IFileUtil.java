package cn.xiaohuodui.util;

import cn.xiaohuodui.util.type.UploadType;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * Created by cqxxxxx on 2016/8/4.
 */
public interface IFileUtil {
    /**
     * 默认bucket 上传文件
     *
     * @param file
     * @return
     */
    public String uploadFile(MultipartFile file);

    /**
     * 默认bucket 上传文件
     *
     * @param file
     * @return
     */
    public String uploadLocalFile(File file);


    public String getImageUpdateToken();


    /**
     * 根据上传类别 上传文件
     *
     * @param file
     * @param type @see
     * @return
     */
    public String uploadFile(MultipartFile file, UploadType type);


    /**
     * 获取下载链接
     *
     * @param key
     * @param uploadType
     * @return
     */
    public String getFileUrl(String key, UploadType uploadType);
}
