package com.tbyf.service.gp.agreementchange.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.service.gp.agreementchange.AgreementchangeManager;
import com.tbyf.util.PageData;

@Service("agreementChangeService")
public class AgreementChangeService implements AgreementchangeManager {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("AgreementChangeMapper.save", pd);
	}
	
	/**
	 * 生成签约变更表
	 */
	@Override
	public void created(PageData pd) throws Exception {
		dao.save("AgreementCreatedMapper.save", pd);
	}
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("AgreementChangeMapper.edit", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AgreementChangeMapper.queryPage", pd);
	}
	@Override
	public PageData findById(String id) throws Exception{
		return (PageData)dao.findForObject("AgreementChangeMapper.findById", id);
	}
	
}
