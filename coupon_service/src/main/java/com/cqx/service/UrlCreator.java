package com.cqx.service;

/**
 * Created by cqxxxxx on 2016/7/20.
 */
public interface UrlCreator {
    public String getUrl(String code, String type); //个人分享的URL生成器
    public String getUrl(String code);              //官方URL生成器
}
