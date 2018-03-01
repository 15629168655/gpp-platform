package com.tbyf.service.gp.jcKnowledgeBase.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.gp.jcKnowledgeBase.JcKnowledgeBaseManager;
import com.tbyf.util.*;

import org.springframework.stereotype.*;

import javax.annotation.*;

import java.util.*;

/** 
 * 说明： 检查知识库
 * 创建人：lizk
 * 创建时间：2016-10-10
 * @version
 */
@Service("jcKnowledgeBaseService")
public class JcKnowledgeBaseService implements JcKnowledgeBaseManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("JcKnowledgeBaseManager.querylistPage", page);
	}
	public void delete(PageData PG)throws Exception{
		dao.delete("JcKnowledgeBaseManager.delete", PG);
	}
	@Override
	public void saveObj(PageData pd)throws Exception{
		dao.save("JcKnowledgeBaseManager.saveObj", pd);
	}
	@Override
	public PageData queryDataById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("JcKnowledgeBaseManager.queryDataById", pd);
	}
	@Override
	public void editObj(PageData pd)throws Exception{
		dao.update("JcKnowledgeBaseManager.editObj", pd);
	}
}

