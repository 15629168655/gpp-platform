package com.tbyf.service.gp.ypknowledgebase.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.ypknowledgebase.YpKnowledgeBaseManager;
import com.tbyf.util.PageData;

/** 
 * 说明： 药品知识库
 * 创建人：lh
 * @version
 */
@Service("ypKnowledgeBaseService")
public class YpKnowledgeBaseService implements YpKnowledgeBaseManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("YpKnowledgeBaseManager.datalistPage", page);
	}

	@Override
	public void save(PageData pd) throws Exception {
		dao.save("YpKnowledgeBaseManager.save", pd);
		
	}

	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("YpKnowledgeBaseManager.delete", pd);
		
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("YpKnowledgeBaseManager.findById", pd);
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("YpKnowledgeBaseManager.edit", pd);
	}

}
