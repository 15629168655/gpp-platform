package com.tbyf.service.information.grdzbl.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.grdzbl.GrdzblManager;
import com.tbyf.util.PageData;

@Service("gedzblService")
public class GrdzblService implements GrdzblManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;	
	
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("GrdzblMapper.datalistPage", page);
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("GrdzblMapper.findById", pd);
	}
	
	/**
	 * app录入个人电子病历
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("GrdzblMapper.save", pd);
		
	}
	
	/**
	 * app删除个人电子病历
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("GrdzblMapper.delete", pd);
	}

	@Override
	public PageData findByTjrId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("GrdzblMapper.findByTjrId", pd);
	}
	/**
	 * 查询居民电子病历列表接口
	 * @param pd
	 * @return
	 * @throws Excepiton
	 */
	@Override
	public List<PageData> queryPageForApp(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("GrdzblMapper.queryPageForApp",pd);
	}

}
