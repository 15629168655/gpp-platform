package com.tbyf.service.gp.checkApplication.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.checkApplication.CheckApplicationManager;
import com.tbyf.util.PageData;

/**
 *  检查申请表
 */
@Service("checkApplicationService")
public class CheckApplicationService implements CheckApplicationManager{
		
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("CheckApplicationMapper.datalistPage", page);
	}

	@Override
	public void save(PageData pd) throws Exception {
			dao.save("CheckApplicationMapper.save", pd);
	}

	@Override
	public void edit(PageData pd) throws Exception {
			dao.update("CheckApplicationMapper.edit", pd);
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("CheckApplicationMapper.findById", pd);
	}

	@Override
	public void del(PageData pd) throws Exception {
			pd.put("STATUS", "9");
			dao.update("CheckApplicationMapper.del", pd);
		}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("CheckApplicationMapper.queryPage", pd);
	}

	@Override
	public void saveCheckApp(PageData pd) throws Exception {
		pd.put("ID", UUID.randomUUID().toString());
		pd.put("STATUS", "0");
		dao.save("CheckApplicationMapper.saveApp", pd);
	}

	@Override
	public void delCheckApp(PageData pd) throws Exception {
		dao.delete("CheckApplicationMapper.delApp", pd);
	}

	@Override
	public void editCheckApp(PageData pd) throws Exception {
		dao.update("CheckApplicationMapper.editApp", pd);
	}

	@Override
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("CheckApplicationMapper.del", ArrayDATA_IDS);
		
	}
		
}
