package com.tbyf.service.gp.emrform.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.emrform.emrformManager;
import com.tbyf.util.PageData;


@Service("emrformService")
public class emrformService implements emrformManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("emrformMapper.datalistPage", page);
	}

	@Override
	public void save(PageData pd) throws Exception {
		dao.save("emrformMapper.save", pd);
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("emrformMapper.edit", pd);
	}
	@Override
	public void editForm(PageData pd) throws Exception {
		dao.update("emrformMapper.editForm", pd);
	}
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("emrformMapper.del", pd);
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return  (PageData) dao.findForObject("emrformMapper.findById", pd);
	}
	
	
}
