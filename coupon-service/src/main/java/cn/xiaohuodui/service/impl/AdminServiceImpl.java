package cn.xiaohuodui.service.impl;

import cn.xiaohuodui.dao.AdminMapper;
import cn.xiaohuodui.form.AdminLoginForm;
import cn.xiaohuodui.model.Admin;
import cn.xiaohuodui.service.AdminService;
import cn.xiaohuodui.util.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
/*
@Service(value = "AdminService")
public class AdminServiceImpl implements AdminService{

    @Autowired
    AdminMapper adminMapper;

    public Admin login(AdminLoginForm adminLoginForm) {
        Admin admin = adminMapper.selectByUsername(adminLoginForm.getUsername());
        if (admin==null){

        }
        if (admin.getPassword().equals(BCrypt.hashpw(adminLoginForm.getPassword(),admin.getSalt()))){
            admin.setPassword("");
            admin.setSalt("");
            return admin;
        }
        return null;
    }
}
*/
