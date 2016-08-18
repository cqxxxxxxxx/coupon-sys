package cn.xiaohuodui.auth;

import cn.xiaohuodui.res.JsonRes;
import org.apache.commons.codec.binary.Base64;
import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;

import static org.springframework.http.HttpStatus.UNAUTHORIZED;


public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
    private static final String AUTH_HEADER = "Authorization";
    public static final String DEFAULT_CONTENT_TYPE = "application/json";
    public static final String DEFAULT_ENCODING = "UTF-8";
    private static final String IGNORE_TOKEN = "6H9nQXhJY2nJllw1cTTAE2QehvGxyGJt";   //用户未登陆也可以进行各种操作
    private static final String AUTH_NAME = "xiaohuodui";

    private ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        boolean isValid = parseAuthHeader(request, response);
        if (!isValid) {
            return this.errorResponseHandle(request, response, "token is not valid");
        }
        return true;
    }

    /**
     * 过滤请求头，返回请求token
     *
     * @param request
     * @return
     */
    public boolean parseAuthHeader(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (null == request) return false;
        String auth = request.getHeader(AUTH_HEADER);
        if (null == auth) return false;
        auth = URLDecoder.decode(auth);
        String[] strs = auth.split(" ");
        if (strs.length == 2 && AUTH_NAME.equals(strs[0])) {
            String tokenStr = new String(Base64.decodeBase64(strs[1].trim().getBytes()));
            return tokenStr.equals(IGNORE_TOKEN);
        }
        return false;
    }

    /**
     * 返回错误请求信息
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    private boolean errorResponseHandle(HttpServletRequest request,
                                        HttpServletResponse response, String msg) throws Exception {
        this.responseHandle(request, response, new JsonRes(msg));
        return false;
    }

    /**
     * 默认返回json
     *
     * @param request
     * @param response
     * @param value
     * @throws Exception
     */
    private void responseHandle(HttpServletRequest request,
                                HttpServletResponse response,
                                Object value) throws Exception {
        response.setContentType(DEFAULT_CONTENT_TYPE);
        response.setCharacterEncoding(DEFAULT_ENCODING);
        response.setStatus(UNAUTHORIZED.value());
        JsonGenerator generator =
                this.objectMapper.getJsonFactory().createJsonGenerator(response.getOutputStream(), JsonEncoding.UTF8);
        this.objectMapper.writeValue(generator, value);
    }
}