package cn.xiaohuodui.controller;

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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Controller
public class BaseController {

    /*private final Logger logger = Logger.getLogger(BaseController.class);
    @Autowired
    AdminService adminService;
    @Autowired
    IFileUtil iFileUtil;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "dashboard";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about() {
        return "about";
    }

    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String goTo404() {
        return "404";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpSession session, Model model) {
        if (session.getAttribute(ApplicationConstants.SESSION_SIGNIN_USER) != null) {
            return "redirect:/";
        }
        model.addAttribute(new AdminLoginForm());
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public
    @ResponseBody
    String logout(HttpSession session, HttpServletResponse response) {
        session.removeAttribute(ApplicationConstants.SESSION_SIGNIN_USER);

        clearCookie(response);
        return ApplicationConstants.RESPONSE_SUCCESS;
    }

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
        adminLoginForm.setRoot(admin.getRoot());
        adminLoginForm.setUid(admin.getId());
        session.setAttribute(ApplicationConstants.SESSION_SIGNIN_USER, adminLoginForm);
        logger.warn("remember:" + adminLoginForm.isRemember());
        if (adminLoginForm.isRemember()) {
            Cookie salt = new Cookie("uc", admin.getSalt());
            //一周 cookie
            salt.setMaxAge(604800);
            Cookie username = null;
            try {
                username = new Cookie("un", URLEncoder.encode(adminLoginForm.getUsername(), "UTF-8"));
                username.setMaxAge(604800);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                logger.error("用户名Encode 到Cookie 错误");
            }
            response.addCookie(salt);
            response.addCookie(username);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/uploadToken", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String uploadToken() {
        UploadTokenVo uploadTokenVo = new UploadTokenVo();
        uploadTokenVo.setUptoken(iFileUtil.getImageUpdateToken());
        return JsonUtil.writeObjectAsString(uploadTokenVo);
    }

    private void clearCookie(HttpServletResponse response) {
        Cookie un = new Cookie("un", null);
        Cookie uc = new Cookie("uc", null);
        un.setMaxAge(0);
        uc.setMaxAge(0);
        response.addCookie(un);
        response.addCookie(uc);
    }

*/
}
