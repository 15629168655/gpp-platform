package com.tbyf.service.gp.agreementsh.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.service.gp.agreementsh.AgreementshManager;
import com.tbyf.util.PageData;

@Service("agreementshService")
public class AgreementshService implements AgreementshManager{
		
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**审核
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("AgreementshMapper.edit", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */	
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AgreementshMapper.findById", pd);
	}
}
