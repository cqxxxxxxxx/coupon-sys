package cn.xiaohuodui.service.impl;

import cn.xiaohuodui.dao.AdminMapper;
import cn.xiaohuodui.exception.BussException;
import cn.xiaohuodui.form.AdminForm;
import cn.xiaohuodui.form.AdminLoginForm;
import cn.xiaohuodui.model.Admin;
import cn.xiaohuodui.service.AdminService;
import cn.xiaohuodui.util.BCrypt;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Service(value = "AdminService")
public class AdminServiceImpl implements AdminService{

    @Autowired
    AdminMapper adminMapper;

    public Admin login(AdminLoginForm adminLoginForm) throws BussException {
        Admin admin = adminMapper.selectByUsername(adminLoginForm.getUsername());
        if (admin==null){
            throw new BussException("用户名不存在", HttpStatus.NOT_FOUND);
        }
        //如果数据库中加密后的密码 跟输入密码结合数据库中salt计算出来的散列值一样 就是密码正确
        if (admin.getPassword().equals(BCrypt.hashpw(adminLoginForm.getPassword(),admin.getSalt()))){
            return admin;
        }else {
            throw new BussException("密码不正确", HttpStatus.BAD_REQUEST);
        }
    }

    public void add(AdminForm adminForm) {
        Admin admin = new Admin();
        long now = System.currentTimeMillis();
        BeanUtils.copyProperties(adminForm,admin);
        String salt = BCrypt.gensalt();  //获取salt
        //密码上加salt 然后散列
        String hashPassword = BCrypt.hashpw(adminForm.getPassword(),salt);
        admin.setSalt(salt);
        admin.setPassword(hashPassword);
        admin.setCreated(now);
        admin.setUpdated(now);
        admin.setRole(2);

        adminMapper.insert(admin);

    }
}
