package com.tbyf.service.gp.jkzx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jkzx.JkzxManager;
import com.tbyf.util.PageData;

/** 
 * 说明：健康咨询
 * 创建人：zhangy
 * 创建时间：2017-02-27
 * @version
 */
@Service("jkzxService")
public class JkzxService implements JkzxManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("JkzxMapper.querylistPage", page);
	}
	/**
	 * app查询健康咨询列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> listForApp(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("JkzxMapper.listForApp", pd);
	}
	public void delete(PageData PG)throws Exception{
		dao.delete("JkzxMapper.delete", PG);
	}
	
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("JkzxMapper.save", pd);
	}
	@Override
	public void editObj(PageData pd) throws Exception {
		dao.update("JkzxMapper.editObj", pd);
		
	}
	@SuppressWarnings("unchecked")
	public List<PageData> findContent(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("JkzxMapper.findContent", pd);
	}
	@Override
	public void saveContent(PageData pd)throws Exception{
		dao.save("JkzxMapper.saveContent", pd);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> findById(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("JkzxMapper.findById", pd);
	}
}
