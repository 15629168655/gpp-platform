package com.tbyf.service.gp.treatecase.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.treatecase.TreateCaseModelManager;
/**治疗方案
 * 
 * @author zanxc
 * @创建日期2017年7月27日下午5:23:32
 */
import com.tbyf.util.PageData;
@Service("treateCaseModelService")
public class TreateCaseModelService implements TreateCaseModelManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TreateCaseModelMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("TreateCaseModelMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("TreateCaseModelMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("TreateCaseModelMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("TreateCaseModelMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(PageData pd) throws Exception {
		dao.update("TreateCaseModelMapper.deleteAll", pd);
		
	}

	@Override
	public void updateCount(PageData pd) throws Exception {
		dao.update("TreateCaseModelMapper.updateCount", pd);
		
	}
	
}
