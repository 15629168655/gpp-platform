package com.tbyf.service.gp.bloodPressure.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.bloodPressure.BloodPressureManager;
import com.tbyf.util.PageData;

/**
 * 门诊测血压
 * @author lizk
 *2016-09-26
 */
@Service("bloodPressureService")
public class BloodPressureService implements BloodPressureManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BloodPressureMapper.datalistPage", page);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("BloodPressureMapper.save", pd);
	}
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BloodPressureMapper.findById", pd);
	}
	
	/**修改信息
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("BloodPressureMapper.edit", pd);
		
	}
	
	/**
	 * 删除
	 * @param pg
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BloodPressureMapper.delete", pd);
	}
	
	/**app接口查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> appDatalist(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BloodPressureMapper.appDatalist", pd);
	}
	
}
