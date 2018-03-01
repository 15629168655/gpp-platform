package com.tbyf.service.hm.fat.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.fat.FatManager;
import com.tbyf.util.PageData;

/**
 * 血脂manager
 * @author zanxc
 *
 */
@Service("fatService")
public class FatService implements FatManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询个人尿酸信息
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("FatMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("FatMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("FatMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("FatMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("FatMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("FatMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(String[] ids) throws Exception {
		dao.update("FatMapper.deleteAll", ids);
		
	}
	/**
	 * app更新血脂四项记录
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("FatMapper.renew", pd);
		
	}
}
