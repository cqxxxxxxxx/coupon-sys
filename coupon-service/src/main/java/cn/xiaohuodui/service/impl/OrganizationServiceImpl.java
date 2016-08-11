package cn.xiaohuodui.service.impl;

import cn.xiaohuodui.dao.OrganizationMapper;
import cn.xiaohuodui.form.OrganizationCreateForm;
import cn.xiaohuodui.model.Organization;
import cn.xiaohuodui.service.ActivityService;
import cn.xiaohuodui.service.OrganizationService;
import cn.xiaohuodui.util.DateUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/8/4.
 */
@Service("OrganizationService")
public class OrganizationServiceImpl implements OrganizationService {

    @Autowired
    OrganizationMapper organizationMapper;

    @Autowired
    ActivityService activityService;

    private final Logger logger = Logger.getLogger(OrganizationServiceImpl.class);

    public boolean createOrganization(OrganizationCreateForm form) throws ParseException {
        //活动表和企业表中都没有该code 则可以进行注册
        if (checkCode(form.getCode()) && activityService.checkCode(form.getCode())) {
            Organization organization = new Organization();
            organization.setCode(form.getCode());
            organization.setName(form.getName());
            organization.setLogo(form.getLogo());
            organization.setDes(form.getDes());
            organization.setTotalLimit(form.getTotal_limit());
            organization.setNum(form.getNum());
            organization.setStarttime(DateUtil.stringToTimeStamp(form.getStarttime()));
            organization.setEndtime(DateUtil.stringToTimeStamp(form.getEndtime()));
            organizationMapper.insert(organization);
            return true;
        } else {
            logger.debug("code已存在");
            return false;
        }
    }

    public boolean checkCode(String code) {
        if (organizationMapper.exist(code) == null) {  //不存在返回true
            return true;
        } else {
            return false;
        }
    }

    public List<Organization> getOrganizations(String keyword, int limit, int offset) {
        List<Organization> organizations = organizationMapper.listPage(keyword, limit, offset);
        return organizations;
    }

    public int countAll(String keyword) {
        return organizationMapper.countAll(keyword);
    }

    public Organization getinfo(String code) {
        return organizationMapper.getInfo(code);
    }

    public boolean updateInfo(Organization organization) {
        System.out.println(organization.getCode());
        System.out.println(organization.getDes());
        System.out.println(organization.getStarttime());
        System.out.println(organization.getId());


        if (organizationMapper.updateInfo(organization) > 0) {
            return true;
        } else {
            logger.debug("更新失败");
            return false;
        }
    }

    public boolean deleteOrganization(String code) {
        if (organizationMapper.deleteOrganization(code) > 0) {
            return true;
        } else {
            logger.debug("删除失败");
            return false;
        }
    }
}
