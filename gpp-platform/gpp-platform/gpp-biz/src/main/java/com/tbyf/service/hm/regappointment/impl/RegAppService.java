package com.tbyf.service.hm.regappointment.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.regappointment.RegAppManager;
import com.tbyf.util.PageData;

@Service("regAppService")
public class RegAppService implements RegAppManager {
	//注入dao 
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("RegAppMapper.save", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("RegAppMapper.datalistPage", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("RegAppMapper.listAll", pd);
	}
	/**
	 * 通过接诊的ID获得预约的信息
	 */
	@Override
	public PageData findByReferralID(PageData pd) throws Exception {
		
		return (PageData)dao.findForObject("RegAppMapper.findByReferralID", pd);
	}

	/**
	 * 更新预约的状态
	 */
	@Override
	public void update(PageData pd) throws Exception {
		
		dao.update("RegAppMapper.changeState", pd);
	}
	/**
	 * 通过ID查询预约的信息
	 */
	public PageData findById(PageData pd) throws Exception{
		return (PageData)dao.findForObject("RegAppMapper.findById", pd);
	}
}
