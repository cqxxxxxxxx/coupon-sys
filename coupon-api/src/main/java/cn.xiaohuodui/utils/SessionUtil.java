package cn.xiaohuodui.utils;

import cn.xiaohuodui.form.AdminLoginForm;

import javax.servlet.http.HttpSession;

/**
 * Created by cqxxxxx on 2016/8/9.
 */
public class SessionUtil {

    public static AdminLoginForm getSignInUser(HttpSession session) {
        return (AdminLoginForm) session.getAttribute(ApplicationConstants.SESSION_SIGNIN_USER);
    }

    public static int getSessionUid(HttpSession session) {
        AdminLoginForm adminLoginForm = getSignInUser(session);
        int uid = 0;
        if (adminLoginForm != null) {
            uid = adminLoginForm.getUid();
        }
        return uid;
    }


}

