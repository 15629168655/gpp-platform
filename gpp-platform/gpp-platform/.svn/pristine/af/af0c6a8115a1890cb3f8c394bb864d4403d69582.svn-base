package com.tbyf.service.hm.departmentinfo.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.departmentinfo.*;
import com.tbyf.util.*;
import org.springframework.stereotype.*;

import javax.annotation.*;
import java.util.*;

/** 
 * 说明： 科室信息
 * 创建人：
 * 创建时间：2016-07-07
 * @version
 */
@Service("departmentinfoService")
public class DepartmentInfoService implements DepartmentInfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("DepartmentInfoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("DepartmentInfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("DepartmentInfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("DepartmentInfoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DepartmentInfoMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DepartmentInfoMapper.findById", pd);
	}

	/**通过科室编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByDEP_CODE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DepartmentInfoMapper.findByDEP_CODE", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("DepartmentInfoMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

