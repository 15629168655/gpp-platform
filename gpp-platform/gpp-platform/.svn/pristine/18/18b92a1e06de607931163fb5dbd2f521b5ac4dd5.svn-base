package com.tbyf.service.hm.organization;

import com.tbyf.entity.hm.organization.*;
import com.tbyf.plugin.*;
import com.tbyf.util.*;

import java.util.*;

/** 
 * 说明： 机构管理接口
 * 创建人：
 * 创建时间：2016-06-22
 * @version
 */
public interface OrganizationManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	/**通过机构组织代码获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByORG_CODE(PageData pd)throws Exception;

	/**通过登记号获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByORG_LOGIN_CODE(PageData pd)throws Exception;

	/**
	 * 通过上级机构代码获取其子级列表
	 * @param P_ORG_CODE
	 * @return
	 * @throws Exception
	 */
	public List<Organization> listSubOrgByP_ORG_CODE(String P_ORG_CODE) throws Exception;

	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param P_ORG_CODE
	 * @return
	 * @throws Exception
	 */
	public List<Organization> listAllOrg(String P_ORG_CODE) throws Exception;
	
	/**
	 * 根据区划查询
	 * @param P_ORG_CODE
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllByRegionCode(PageData pd) throws Exception;
	
	/**排查表检查是否被占用
	 * @param pd
	 * @throws Exception
	 */
	public PageData findFromTbs(PageData pd)throws Exception;

	/**
	 * 生成机构树结构
	 * 当type和action均非空时，才设置链接，所以可以通过向方法传递null的type和空的action来获取不可不带url的tree
	 * @param P_ORG_CODE 节点的id
	 * @param type 业务名称
	 * @param action 跳转的action
	 * @return
	 * @throws Exception
	 */
	public List<Organization> packageTreeDate(String P_ORG_CODE,String type,String action) throws Exception;

	/**将叶子节点转换为父节点
	 * @param pd
	 * @throws Exception
	 */
	public void changeToParent(PageData pd) throws Exception;
	
	/**
	 *通过机构编码获取机构区划编码 
	 * @param orgCode
	 * @return
	 */
	public String getOrgRegionCodeByOrgCode(String orgCode)throws Exception;
	/**获取所有的机构
	 * 
	 * @param P_ORG_CODE
	 * @return
	 * @throws Exception
	 */
	public List<Organization> listAllCompany(String P_ORG_CODE) throws Exception;
	
}

