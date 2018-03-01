package com.tbyf.service.gp.knowledgebase.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.gp.knowledgebase.KnowledgeBaseManager;
import com.tbyf.service.gp.provider.ProviderManager;
import com.tbyf.service.hm.agreementApply.AgreementApplyManager;
import com.tbyf.util.*;

import org.springframework.stereotype.*;

import javax.annotation.*;

import java.util.*;

/** 
 * 说明： 医学知识库
 * 创建人：zhangy
 * 创建时间：2016-09-18
 * @version
 */
@Service("knowledgeBaseService")
public class KnowledgeBaseService implements KnowledgeBaseManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("KnowledgeBaseMapper.querylistPage", page);
	}
	public void delete(PageData PG)throws Exception{
		dao.delete("KnowledgeBaseMapper.delete", PG);
	}
	@Override
	public void saveObj(PageData pd)throws Exception{
		dao.save("KnowledgeBaseMapper.saveObj", pd);
	}
	@Override
	public PageData queryDataById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("KnowledgeBaseMapper.queryDataById", pd);
	}
	@Override
	public void editObj(PageData pd)throws Exception{
		dao.update("KnowledgeBaseMapper.editObj", pd);
	}
}

