package com.tbyf.service.gp.index.resultmodel.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.resultmodel.IndexResultModelManager;
import com.tbyf.util.PageData;
/**
 *指标结果模板Service
 * @author zanxc
 *
 */
@Service("indexResultModelService")
public class IndexResultModelService implements IndexResultModelManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询指标
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexResultModelMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("IndexResultModelMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("IndexResultModelMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("IndexResultModelMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexResultModelMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("IndexResultModelMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(PageData pd) throws Exception {
		dao.update("IndexResultModelMapper.deleteAll", pd);
		
	}
	/**
	 * app更新血脂四项记录
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("IndexResultModelMapper.renew", pd);
		
	}
	

	/**
	 * 通过指标ID查询指标的模板
	 */
	@Override
	public List<PageData> findByIndexId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexResultModelMapper.findByIndexId", pd);
	}
}
