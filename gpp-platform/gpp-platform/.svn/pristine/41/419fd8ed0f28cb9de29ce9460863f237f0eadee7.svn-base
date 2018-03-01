package com.tbyf.service.hm.departments.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.hm.departments.Departments;
import com.tbyf.entity.hm.organization.Organization;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.departments.DepartmentsManager;
import com.tbyf.service.hm.organization.OrganizationManager;
import com.tbyf.util.PageData;

/** 
 * 说明： 科室管理
 * 创建人：
 * 创建时间：2016-06-24
 * @version
 */
@Service("departmentsService")
public class DepartmentsService implements DepartmentsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("DepartmentsMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("DepartmentsMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("DepartmentsMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("DepartmentsMapper.datalistPage", page);
	}
	
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DepartmentsMapper.findById", pd);
	}
	
	/**通过科室标识DEP_ID获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByDEP_ID(PageData pd) throws Exception
	{
		return (PageData)dao.findForObject("DepartmentsMapper.findByDEP_ID", pd);
	}
	
	/**通过机构编码ORG_CODE获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public List<PageData>  findByORG_CODE(String ORG_CODE) throws Exception
	{
		return  (List<PageData> )dao.findForList("DepartmentsMapper.findByORG_CODE", ORG_CODE);
	}
	
	/**
	 * 通过上级科室标识PARENT_DEP_ID获取其子级列表
	 * @param PARENT_DEP_ID
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Departments> listSubDepByPARENT_DEP_ID(String PARENT_DEP_ID) throws Exception
	{
		return (List<Departments>) dao.findForList("DepartmentsMapper.listSubDepByPARENT_DEP_ID", PARENT_DEP_ID);
	}
	/**
	 * 通过上级科室标识P_DEP_ID获取其子级列表
	 * @param P_DEP_ID
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Departments> listSubDepByP_DEP_ID(String PARENT_DEP_ID) throws Exception
	{
		return (List<Departments>) dao.findForList("DepartmentsMapper.listSubDepByP_DEP_ID", PARENT_DEP_ID);
	}
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param PARENT_DEP_ID
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Departments> listAllDep(String PARENT_DEP_ID) throws Exception
	{
		List<Departments> depList = this.listSubDepByPARENT_DEP_ID(PARENT_DEP_ID);
		for(Departments dep : depList){
			dep.setTreeurl("departments/list.do?DEPARTMENTS_ID="+dep.getDEPARTMENTS_ID());
			dep.setSubDepartments(this.listAllDep(dep.getDEPARTMENTS_ID()));
			dep.setTarget("treeFrame");
		}
		return depList;
	}

	/**
	 * 无点击url树
	 */
	public List<Departments> getDepTree(String id) throws Exception {
		List<Departments> depList=this.listSubDepByP_DEP_ID(id);
		for(Departments dep : depList){
			dep.setName(dep.getDEP_NAME());
			dep.setId(dep.getDEP_ID());
			dep.setPId(id);
			
			dep.setTarget("treeFrame");
			dep.setIsParent(true);

			/*if(this.listSubDepByPARENT_DEP_ID(dep.getDEP_ID()).size() ==0)
			{
				dep.setIsParent(false);
			}*/
			if(dep.getISLEAF().equals("1"))
			{
				dep.setIsParent(false);
			}
		}
		return depList;
	}
	
	/**将叶节点转换为父节点
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void changeToParent(PageData pd) throws Exception
	{
		dao.update("DepartmentsMapper.changeToParent", pd);
	}

	
	/**排查表检查是否被占用
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findFromTbs(PageData pd) throws Exception
	{
		return (PageData)dao.findForObject("DepartmentsMapper.findFromTbs", pd);
	}
	
}

