package cn.xiaohuodui.service;

import cn.xiaohuodui.form.OrganizationCreateForm;
import cn.xiaohuodui.model.Organization;

import java.text.ParseException;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/8/4.
 */
public interface OrganizationService {

     boolean createOrganization(OrganizationCreateForm form) throws ParseException;

     boolean checkCode(String code);

     List<Organization> getOrganizations(String keyword, int limit, int offset); //分页版本

     int countAll(String keyword);

     Organization getinfo(String code);

     boolean updateInfo(Organization organization);

     boolean deleteOrganization(String code);
}
