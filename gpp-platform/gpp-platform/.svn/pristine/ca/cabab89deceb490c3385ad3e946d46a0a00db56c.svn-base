package com.tbyf.service.hm.departments;

import java.util.List;

import com.tbyf.entity.hm.departments.Departments;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明： 科室管理接口
 * 创建人：
 * 创建时间：2016-06-24
 * @version
 */
public interface DepartmentsManager{

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
	
	/**通过科室标识DEP_ID获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByDEP_ID(PageData pd)throws Exception;
	
	/**通过机构编码ORG_CODE获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByORG_CODE(String ORG_CODE)throws Exception;
	
	/**
	 * 通过上级科室标识PARENT_DEP_ID获取其子级列表
	 * @param PARENT_DEP_ID
	 * @return
	 * @throws Exception
	 */
	public List<Departments> listSubDepByPARENT_DEP_ID(String PARENT_DEP_ID) throws Exception;
	/**
	 * 通过上级科室标识PAREN_DEP_ID获取其子级列表
	 * @param P_DEP_ID
	 * @return
	 * @throws Exception
	 */
	public List<Departments> listSubDepByP_DEP_ID(String PARENT_DEP_ID) throws Exception;
	
	/**
	 * 无点击Url树
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<Departments> getDepTree(String id) throws Exception ;
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param PARENT_DEP_ID
	 * @return
	 * @throws Exception
	 */
	public List<Departments> listAllDep(String PARENT_DEP_ID) throws Exception;

	/**排查表检查是否被占用
	 * @param pd
	 * @throws Exception
	 */
	public PageData findFromTbs(PageData pd)throws Exception;

	//public List<Departments> packageTreeDate(String PARENT_DEP_ID) throws Exception;
	
	/**将叶子节点转换为父节点
	 * @param pd
	 * @throws Exception
	 */
	public void changeToParent(PageData pd) throws Exception;
	
}

