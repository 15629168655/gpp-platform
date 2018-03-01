package com.tbyf.service.gp.sfjl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.service.gp.sfjl.EhrManager;
import com.tbyf.util.PageData;

@Service("ehrService")
public class EhrService implements EhrManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public PageData getEhr(PageData pd) throws Exception{
		// TODO Auto-generated method stub
		List<PageData> list =  (List<PageData>)dao.findForList("EhrMapper.getEhr", pd);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

}
