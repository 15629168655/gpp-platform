package com.tbyf.service.gp.index.screeningcombination.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.screeningcombination.QuestionnaireCombinationManager;
import com.tbyf.util.PageData;

/**指标组合关联
 * 
 * @author zanxc
 *
 */
@Service("questionnaireCombinationService")
public class QuestionnaireCombinationService implements QuestionnaireCombinationManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询指标
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexCombinationQuesMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("IndexCombinationQuesMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("IndexCombinationQuesMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("IndexCombinationQuesMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexCombinationQuesMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("IndexCombinationQuesMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(String[] ids) throws Exception {
		dao.update("IndexCombinationQuesMapper.deleteAll", ids);
		
	}
	/**
	 * app更新血脂四项记录
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("IndexCombinationQuesMapper.renew", pd);
		
	}

	@Override
	public List<PageData> findByScreeningId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexCombinationQuesMapper.findByScreeningId", pd);
	}
	@Override
	public List<PageData> findByNot(Page page) throws Exception {
		return (List<PageData>)dao.findForList("IndexCombinationQuesMapper.datapage", page);
	}
}
