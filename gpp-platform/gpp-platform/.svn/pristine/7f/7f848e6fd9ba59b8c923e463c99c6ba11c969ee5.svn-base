package com.tbyf.service.gp.index.score.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.score.IndexScoreManager;
import com.tbyf.util.PageData;
/**
 * 评分等级
 * @author zanxc
 * @创建日期2017年8月4日下午5:18:34
 */
@Service("indexScoreService")
public class IndexScoreService implements IndexScoreManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	/**
	 * 保存评分等级
	 */
	public void save(PageData pd) throws Exception {
		dao.update("IndexScoreMapper.save", pd);
		
	}
	/**
	 * 通过筛查问卷查询问卷
	 */
	@Override
	public List<PageData> findByScreeningQuesId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("IndexScoreMapper.findByScreeningQuesId", pd);
	}

	@Override
	public List<PageData> list(Page page) throws Exception {
		return(List<PageData>)dao.findForList("IndexScoreMapper.dataList", page);
	}

	@Override
	public void deleteByScreeningQuesId(PageData pd) throws Exception {
		dao.delete("IndexScoreMapper.deleteByScreeningQuesId", pd);
		
	}

}
