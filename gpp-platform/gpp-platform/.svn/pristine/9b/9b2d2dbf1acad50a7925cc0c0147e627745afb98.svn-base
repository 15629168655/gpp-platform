package com.tbyf.service.hm.organization.impl;

import com.tbyf.dao.*;
import com.tbyf.entity.hm.organization.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.organization.*;
import com.tbyf.util.*;

import org.springframework.stereotype.*;

import javax.annotation.*;

import java.util.*;

/** 
 * 说明： 机构管理
 * 创建人：
 * 创建时间：2016-06-22
 * @version
 */
@Service("organizationService")
public class OrganizationService implements OrganizationManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("OrganizationMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("OrganizationMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("OrganizationMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrganizationMapper.datalistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrganizationMapper.findById", pd);
	}

	/**通过组织机构代码获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByORG_CODE(PageData pd) throws Exception
	{
		return (PageData)dao.findForObject("OrganizationMapper.findByORG_CODE", pd);
	}

	/**通过登记号获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByORG_LOGIN_CODE(PageData pd) throws Exception
	{
		return (PageData)dao.findForObject("OrganizationMapper.findByORG_LOGIN_CODE", pd);
	}

	/**
	 * 通过上级机构代码获取其子级列表
	 * @param P_ORG_CODE
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Organization> listSubOrgByP_ORG_CODE(String P_ORG_CODE) throws Exception
	{
		return (List<Organization>) dao.findForList("OrganizationMapper.listSubOrgByP_ORG_CODE", P_ORG_CODE);
	}

	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param P_ORG_CODE
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Organization> listAllOrg(String P_ORG_CODE) throws Exception
	{
		List<Organization> orgList = this.listSubOrgByP_ORG_CODE(P_ORG_CODE);
		for(Organization org : orgList){
			org.setTreeurl("organization/goEdit.do?ORGANIZATION_ID="+org.getORGANIZATION_ID());
			org.setSubOrganization(this.listAllOrg(org.getORGANIZATION_ID()));
			org.setTarget("treeFrame");
		}
		return orgList;
	}
	/**
	 * 根据区划查询
	 * @param P_ORG_CODE
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllByRegionCode(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("OrganizationMapper.listAllByRegionCode", pd);
	}

	/**
	 * 生成机构树结构
	 * 当type和action均非空时，才设置链接，所以可以通过向方法传递null的type和空的action来获取不可不带url的tree
	 * @param id 节点的id
	 * @param type 业务名称
	 * @param action 跳转的action
	 * @return
     * @throws Exception
     */
	public List<Organization> packageTreeDate(String id,String type,String action) throws Exception {
		List<Organization> orgList=this.listSubOrgByP_ORG_CODE(id);
		for(Organization org : orgList){
			if(Tools.notEmpty(type) && Tools.notEmpty(action))
			{
				org.setUrl(type+"/"+action+".do?ORGANIZATION_ID="+org.getORGANIZATION_ID()+"&ORG_CODE="+org.getORG_CODE()+"&ISLEAF="+org.getISLEAF());
			}
			org.setName(org.getORG_NAME());
			org.setId(org.getORG_CODE());
			org.setPId(id);
			org.setTarget("treeFrame");
			org.setIsParent(true);

			if(org.getISLEAF().equals("1"))
			{
				org.setIsParent(false);
			}
		}
		return orgList;
	}

	/**将叶节点转换为父节点
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void changeToParent(PageData pd) throws Exception
	{
		dao.update("OrganizationMapper.changeToParent", pd);
	}

	/**排查表检查是否被占用
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findFromTbs(PageData pd) throws Exception
	{
		return (PageData)dao.findForObject("OrganizationMapper.findFromTbs", pd);
	}
	
	@Override
	public String getOrgRegionCodeByOrgCode(String orgCode)throws Exception{
		String result = "";
		PageData pd = new PageData();
		pd.put("ORG_CODE", orgCode);
		pd = this.findByORG_CODE(pd);
		if(pd!=null)result = pd.getString("REGIONCODE");
		return result;
	}

	@Override
	public List<Organization> listAllCompany(String P_ORG_CODE) throws Exception {
		List<Organization> orgList = this.listSubOrgByP_ORG_CODE(P_ORG_CODE);
		for(Organization org : orgList){
			org.setTreeurl("");
			org.setSubOrganization(this.listAllCompany(org.getORG_CODE()));
			org.setTarget("treeFrame");
		}
		return orgList;
	}
	
}

