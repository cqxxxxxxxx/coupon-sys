package cn.xiaohuodui.controller;

import cn.xiaohuodui.exception.BussException;
import cn.xiaohuodui.form.AdminLoginForm;
import cn.xiaohuodui.model.Admin;
import cn.xiaohuodui.service.AdminService;
import cn.xiaohuodui.utils.ApplicationConstants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Controller
public class BaseController {
    private final Logger logger = Logger.getLogger(BaseController.class);

    @Autowired
    AdminService adminService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request, HttpSession session, Model model) {
        model.addAttribute(new AdminLoginForm());
        return "login";
    }

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public String index() {
        return "redirect:/activities";
    }

    /**
     * @param adminLoginForm
     * @param result
     * @param session
     * @param response
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginIn(AdminLoginForm adminLoginForm, BindingResult result, HttpSession session, HttpServletResponse response) {
        Admin admin;
        try {
            admin = adminService.login(adminLoginForm);
        } catch (BussException e) {
            e.printStackTrace();
            if (e.getHttpStatus().equals(HttpStatus.NOT_FOUND)) {
                result.addError(new FieldError("adminLoginForm", "username", "用户帐号不存在"));
            } else {
                result.addError(new FieldError("adminLoginForm", "password", "用户密码不正确"));
            }
            return "login";
        }
        adminLoginForm.setRole(admin.getRole());
        adminLoginForm.setUid(admin.getId());
        //登录成功则把name放到session中
        session.setAttribute(ApplicationConstants.SESSION_SIGNIN_USER, adminLoginForm);
        //如果选择了记住账号则把username和salt放到Cookie中，设置保存一周，然后把cookie发给浏览器，保存在用户本地
        if (adminLoginForm.isRemember()) {
            Cookie username = null;
            Cookie salt = null;
            try {
//                以UTF-8编码信息保存到cookie中，相应的取出cookie中信息时也要utf-8解码信息
                salt = new Cookie("uc", URLEncoder.encode(admin.getSalt(), "UTF-8"));
                salt.setMaxAge(604800);  //cookie存在时间1周
                username = new Cookie("username", URLEncoder.encode(admin.getUsername(), "UTF-8"));
                username.setMaxAge(604800);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                logger.error("编码出现异常");
                return "login";
            }
            response.addCookie(salt);
            response.addCookie(username);

        }
        return "redirect:/chart/todayInfo";
    }

    /**
     * 清除session 和 cookie
     *
     * @param session
     * @param response
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public
    @ResponseBody
    String logout(HttpSession session, HttpServletResponse response) {
        session.removeAttribute(ApplicationConstants.SESSION_SIGNIN_USER);
        clearCookie(response);
        return ApplicationConstants.RESPONSE_SUCCESS;
    }

    /**
     * 把登出的时候把cookie清除，把内容置为null，保存时间置为0,然后发给浏览器，替换掉以前的cookie
     *
     * @param response
     */
    private void clearCookie(HttpServletResponse response) {
        Cookie username = new Cookie("username", null);
        Cookie uc = new Cookie("uc", null);
        username.setMaxAge(0);
        uc.setMaxAge(0);
        response.addCookie(username);
        response.addCookie(uc);
    }

    @RequestMapping(value = "/getinfo", method = RequestMethod.GET)
    public String getInfo(HttpServletRequest request) {
        System.out.println(request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE));
        System.out.println(request.getContextPath());
        System.out.println(request.getAuthType());
        System.out.println(request.getMethod());
        System.out.println(request.getRequestURI());
        System.out.println(request.getRequestURL());
        System.out.println(request.getServletPath());
        return "error";
    }
}
