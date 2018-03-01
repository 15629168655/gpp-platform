package com.tbyf.service.hm.sugar.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.sugar.SugarManager;
import com.tbyf.util.PageData;

/**血糖Service
 * 
 * @author zanxc
 *
 */
@Service("sugarService")
public class SugarService implements SugarManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询个人尿酸信息
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("SugarMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("SugarMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("SugarMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("SugarMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("SugarMapper.findById", pd);
	}
	
	/**
	 * 根据用户ID查询最近一次记录
	 */
	@Override
	public PageData findLastByUserID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("SugarMapper.findLastByUserID", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("SugarMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(String[] ids) throws Exception {
		dao.update("SugarMapper.deleteAll", ids);
		
	}
	/**
	 * app更新血糖记录
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("SugarMapper.renew", pd);
		
	}
}
