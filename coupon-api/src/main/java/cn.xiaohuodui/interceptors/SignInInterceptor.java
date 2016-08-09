package cn.xiaohuodui.interceptors;

import cn.xiaohuodui.dao.AdminMapper;
import cn.xiaohuodui.form.AdminLoginForm;
import cn.xiaohuodui.model.Admin;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.SessionUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;


/**
 * Created by cqxxxxx on 2016/8/9.
 */
public class SignInInterceptor extends HandlerInterceptorAdapter {

    private final Logger logger = Logger.getLogger(SignInInterceptor.class);

    @Autowired
    private AdminMapper adminMapper;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String login = "/login";
        String logout = "/logout";
        System.out.println("-----------------拦截器启动------------------");
        //如果请求为 /login  404  或者包含resources的资源请求则放过，不拦截
        if (request.getRequestURI().endsWith(logout) || request.getRequestURI().endsWith(login) || request.getRequestURI().endsWith("404") || request.getRequestURI().contains("resources")) {
            logger.debug("inteceptor:请求为"+request.getRequestURI());
            return true;
        }
        HttpSession session = request.getSession();  //得到当前session，如果是null则创建一个
        AdminLoginForm adminLoginForm = SessionUtil.getSignInUser(session);

//        如果Session中 没有用户信息，则查看cookie中是否存在
        if (adminLoginForm == null) {
            System.out.println("--------------Session中没有，前往Cookie-----------");
            logger.debug("Session无效:Session中没有用户信息");
            //getCookies返回一个本网站的cookies数组
            Cookie[] cookies = request.getCookies();
            if (cookies == null) {
                logger.debug("Session无效-Cookie无效");
                //cookies为空 则重定向到登录页面
                response.sendRedirect(login);
                return false;
            } else {
                AdminLoginForm signOnVo = isValidCookie(cookies);

                //如果cookie中没有本网站用户的对应信息，或者信息不完整或者出错，则删除无效cookie
                if (signOnVo == null) {
                    Cookie username = new Cookie("username", null);
                    Cookie uc = new Cookie("uc", null);
                    username.setMaxAge(0);
                    uc.setMaxAge(0);
                    response.addCookie(username); //通过response 给客户端添加cookie
                    response.addCookie(uc);
                    response.sendRedirect(login);
                    logger.debug("session无效-cookie无效：设置好cookie并重定向");
                    return false;
                } else {  //用户cookie存在且信息完整正确
                    session.setAttribute(ApplicationConstants.SESSION_SIGNIN_USER, signOnVo);
                    request.setAttribute(ApplicationConstants.SESSION_SIGNIN_USER_ID, signOnVo.getUid());
                    System.out.println("--------------Cookie有效---------------");
                    logger.debug("session无效-cookie有效：把用户信息保存到session中，把uid保存到request中");
                    return true;
                }
            }
        } else {
            request.setAttribute(ApplicationConstants.SESSION_SIGNIN_USER_ID, adminLoginForm.getUid());
            logger.debug("session中有用户信息，uid设置到request中");
            return true;
        }
    }

    /**
     * 判断cookie中是否有用户信息，以及信息是否完整正确
     *
     * @param cookies
     * @return
     */
    private AdminLoginForm isValidCookie(Cookie[] cookies) {
        String username = null;
        String salt = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                try { //从cookie中取出username对应的值，以utf-8解码
                    username = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    logger.debug("Cookie中username："+username);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    logger.error("解析Cookie出错");
                    return null;
                }
            }
            if (cookie.getName().equals("uc")) {  //cookie中的salt
                salt = cookie.getValue();
                logger.debug("Cookie中salt："+salt);
            }
        }
        if (username == null) {  //如果cookie中没有用户信息，返回null
            logger.debug("Cookie中不存在用户信息");
            return null;
        }

        Admin admin = adminMapper.selectByUsername(username);

//        判断数据库中是否有该用户，cookie中salt是否跟数据库中salt一致
        if (admin != null && salt != null && salt.equals(admin.getSalt())) {
            logger.debug("cookie有效");
            return fromUser(admin);
        } else {
            logger.debug("Cookie无效跟数据库中信息不匹配");
            return null;
        }
    }

    /**
     * Admin信息插入到AdminLoginForm并返还。
     *
     * @param user
     * @return
     */
    private AdminLoginForm fromUser(Admin user) {
        AdminLoginForm adminLoginForm = new AdminLoginForm();
        adminLoginForm.setUid(user.getId());
        adminLoginForm.setUsername(user.getUsername());
        return adminLoginForm;
    }

}
