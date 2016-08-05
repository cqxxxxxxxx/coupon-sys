package cn.xiaohuodui.service;

import cn.xiaohuodui.form.OrganizationCreateForm;
import cn.xiaohuodui.model.Organization;

import java.text.ParseException;
import java.util.List;

/**
 * Created by cqxxxxx on 2016/8/4.
 */
public interface OrganizationService {

    public boolean createOrganization(OrganizationCreateForm form) throws ParseException;

    public boolean checkCode(String code);

    public List<Organization> getOrganizations(String keyword, int limit, int offset); //分页版本

    public int countAll(String keyword);

    public Organization getinfo(String code);

    public boolean updateInfo(Organization organization);

    public boolean deleteOrganization(String code);
}
