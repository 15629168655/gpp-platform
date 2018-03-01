package com.tbyf.service.gp.ypmx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.ypknowledgebase.YpKnowledgeBaseManager;
import com.tbyf.service.gp.ypmx.YpmxManager;
import com.tbyf.util.PageData;

@Service("ypmxService")
public class YpmxService implements YpmxManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("YpmxMapper.datalistPage",page);
	}

}
