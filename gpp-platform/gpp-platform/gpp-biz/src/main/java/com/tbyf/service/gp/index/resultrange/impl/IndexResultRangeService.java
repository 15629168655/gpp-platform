package com.tbyf.service.gp.index.resultrange.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.resultrange.IndexResultRangeManager;
import com.tbyf.util.PageData;

/**
 *指标结果范围Service
 * @author zanxc
 *
 */
@Service("indexResultRangeService")
public class IndexResultRangeService  implements IndexResultRangeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询指标
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexResultRangeMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("IndexResultRangeMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("IndexResultRangeMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("IndexResultRangeMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexResultRangeMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("IndexResultRangeMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(PageData pd) throws Exception {
		dao.update("IndexResultRangeMapper.deleteAll", pd);
		
	}
	/**
	 * app更新血脂四项记录
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("IndexResultRangeMapper.renew", pd);
		
	}

	/**
	 * 通过ID查询指标结果的范围
	 */
	@Override
	public List<PageData> findByIndexId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexResultRangeMapper.findByIndexId", pd);
	}
}