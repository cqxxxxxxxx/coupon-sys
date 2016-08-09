package cn.xiaohuodui.service;

import cn.xiaohuodui.exception.BussException;
import cn.xiaohuodui.form.AdminForm;
import cn.xiaohuodui.form.AdminLoginForm;
import cn.xiaohuodui.model.Admin;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
public interface AdminService {
    public Admin login(AdminLoginForm adminLoginForm) throws BussException;

    public void add(AdminForm adminForm);
}
