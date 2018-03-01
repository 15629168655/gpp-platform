package com.tbyf.service.gp.zzknowledgebase.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.gp.zzknowledgebase.ZzKnowledgeBaseManager;
import com.tbyf.util.*;

import org.springframework.stereotype.*;

import javax.annotation.*;

import java.util.*;

/** 
 * 说明： 医学知识库--症状
 * 创建人：zhangy
 * 创建时间：2016-09-20
 * @version
 */
@Service("zzKnowledgeBaseService")
public class ZzKnowledgeBaseService implements ZzKnowledgeBaseManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ZzKnowledgeBaseMapper.querylistPage", page);
	}
	public void delete(PageData PG)throws Exception{
		dao.delete("ZzKnowledgeBaseMapper.delete", PG);
	}
	@Override
	public void saveObj(PageData pd)throws Exception{
		dao.save("ZzKnowledgeBaseMapper.saveObj", pd);
	}
	@Override
	public PageData queryDataById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ZzKnowledgeBaseMapper.queryDataById", pd);
	}
	@Override
	public void editObj(PageData pd)throws Exception{
		dao.update("ZzKnowledgeBaseMapper.editObj", pd);
	}
}

