package cn.xiaohuodui.controller;

import cn.xiaohuodui.form.OrganizationCreateForm;
import cn.xiaohuodui.model.Organization;
import cn.xiaohuodui.service.OrganizationService;
import cn.xiaohuodui.util.DateUtil;
import cn.xiaohuodui.util.IFileUtil;
import cn.xiaohuodui.utils.ApplicationConstants;
import cn.xiaohuodui.utils.JsonUtil;
import cn.xiaohuodui.vo.UploadTokenVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cqxxxxx on 2016/8/3.
 */
@Controller
@RequestMapping(value = "/organization")
public class OrganizationController {

    @Value("#{utilSetting['qiniu.domain']}")
    private String domain;

    @Autowired
    OrganizationService organizationService;

    @Autowired
    IFileUtil iFileUtil;

    //跳转
    @RequestMapping(method = RequestMethod.GET)
    public String organization(Model model) {
        model.addAttribute("domain", "7xl7mb.com1.z0.glb.clouddn.com");
        model.addAttribute("uptoken_url", "/uploadToken");
        return "orgActivities";
    }

    //  分页
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public
    @ResponseBody
    String getOrganizations(HttpServletRequest request) {

        String keyword = request.getParameter("sSearch");
        String sEchoStr = request.getParameter("sEcho");
        int sEcho = sEchoStr == null ? 0 : Integer.parseInt(sEchoStr);
        String limitStr = request.getParameter("iDisplayLength");
        int limit = limitStr == null ? ApplicationConstants.CRM_PAGE_SIZE : Integer.parseInt(limitStr);
        String offsetStr = request.getParameter("iDisplayStart");
        int offset = offsetStr == null ? 0 : Integer.parseInt(offsetStr);

        System.out.println("offset:" + request.getParameter("iDisplayStart"));
        System.out.println("limit:" + request.getParameter("iDisplayLength"));
        System.out.println("keyword:" + keyword + "--limit:" + limit + "--offset:" + offset);

        List<Organization> organizations = organizationService.getOrganizations(keyword, limit, offset);

        Map<String, Object> results = new HashMap<String, Object>();
        results.put("aaData", organizations);
        results.put("sEcho", sEcho);
        results.put("iTotalDisplayRecords", organizationService.countAll(keyword));
        results.put("iTotalRecords", organizationService.countAll(keyword));

        System.out.println(JsonUtil.writeObjectAsString(results));

        return JsonUtil.writeObjectAsString(results);

    }

    //  添加页面的跳转
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addOrganization(Model model) {
        System.out.println("7xl7mb.com1.z0.glb.clouddn.com");
        model.addAttribute("domain", "7xl7mb.com1.z0.glb.clouddn.com");
        model.addAttribute("uptoken_url", "/uploadToken");
        return "addOrganization";
    }


    @RequestMapping(value = "/uploadToken", method = RequestMethod.GET)
    public
    @ResponseBody
    String uploadToken() {
        UploadTokenVo uploadTokenVo = new UploadTokenVo();
        uploadTokenVo.setUptoken(iFileUtil.getImageUpdateToken());
        return JsonUtil.writeObjectAsString(uploadTokenVo);
    }

    //  新增或者更新操作
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    String addOrganization(@ModelAttribute OrganizationCreateForm form) throws ParseException {
        if (organizationService.createOrganization(form)){
            return ApplicationConstants.RESPONSE_SUCCESS;
        }else {
            return ApplicationConstants.RESPONSE_FAIL;
        }

    }

    // 查询信息
    @RequestMapping(value = "/info/{code}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String getOrganizationInfo(@PathVariable("code") String code) {
   /*     Organization organization = organizationService.getinfo(code);
        OrganizationVo organizationVo = new OrganizationVo(organization);*/
        return JsonUtil.writeObjectAsString(organizationService.getinfo(code));
    }

    // 查看code是否存在
    @RequestMapping(value = "{code}/check", method = RequestMethod.GET)
    public
    @ResponseBody
    String checkcode(@PathVariable(value = "code") String code){
        if (organizationService.checkCode(code)){
            return ApplicationConstants.RESPONSE_SUCCESS;
        }else {
            return ApplicationConstants.RESPONSE_FAIL;
        }
    }

    //更新信息
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public
    @ResponseBody
    String updateOrganizationInfo(String code, String des, String logo, int num, int totalLimit, String starttime, String endtime) throws ParseException {

        Organization organization = new Organization();
        organization.setCode(code);
        organization.setDes(des);
        organization.setNum(num);
        organization.setLogo(logo);
        organization.setTotalLimit(totalLimit);
        organization.setStarttime(DateUtil.stringToTimeStamp(starttime));
        organization.setEndtime(DateUtil.stringToTimeStamp(endtime));
        System.out.println("org:" + organization);

        if (organizationService.updateInfo(organization)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        } else {
            return ApplicationConstants.RESPONSE_FAIL;
        }
    }

    //删除企业活动
    @RequestMapping(value = "/delete/{code}", method = RequestMethod.DELETE)
    public
    @ResponseBody
    String deleteOrganization(@PathVariable("code") String code){
        System.out.println(code);
        if (organizationService.deleteOrganization(code)) {
            return ApplicationConstants.RESPONSE_SUCCESS;
        }else {
            return ApplicationConstants.RESPONSE_FAIL;
        }
    }

}

