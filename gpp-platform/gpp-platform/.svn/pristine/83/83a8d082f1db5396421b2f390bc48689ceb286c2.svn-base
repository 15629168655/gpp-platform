package com.tbyf.service.gp.mzregapp.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzregapp.MzregappManager;
import com.tbyf.util.PageData;

/** 
 * 说明：APP预约挂号
 * 创建人：zhangy
 * 创建时间：2017-02-21
 * @version
 */
@Service("mzregappService")
public class MzregappService implements MzregappManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MzregappMapper.datalistPage", page);
	}
	public void delete(PageData PG)throws Exception{
		dao.delete("MzregappMapper.delete", PG);
	}
	
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("MzregappMapper.save", pd);
	}
	@Override
	public void cancel(PageData pd) throws Exception {
		dao.update("MzregappMapper.cancel", pd);
		
	}
	@SuppressWarnings("unchecked")
	public List<PageData> queryData(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MzregappMapper.queryData", pd);
	}
}
