package com.tbyf.service.gp.treatecase.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.treatecase.TreateCaseManager;
import com.tbyf.util.PageData;

@Service("treateCaseService")
public class TreateCaseService implements TreateCaseManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> list(Page page) throws Exception {
		
		return (List<PageData>)dao.findForList("TreateCaseMapper.datalistPage", page);
	}

	@Override
	public void save(PageData pd) throws Exception {

		dao.save("TreateCaseMapper.save", pd);
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("TreateCaseMapper.edit", pd);
		
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("TreateCaseMapper.findById", pd);
	}

	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("TreateCaseMapper.delete", pd);
		
	}

	@Override
	public void delAll(PageData pd) throws Exception {
		dao.delete("TreateCaseMapper.delAll", pd);
		
	}

	@Override
	public List<PageData> findByModelId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TreateCaseMapper.findByModelId", pd);
	}

	@Override
	public void changeState(PageData pd) throws Exception {
		dao.update("TreateCaseMapper.changeState", pd);
		
	}

	@Override
	public void changCaseCount(PageData pd) throws Exception {
		dao.update("TreateCaseMapper.changCaseCount", pd);
		
	}

	@Override
	public List<PageData> findByResidentId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TreateCaseMapper.findByResidentId", pd);
	}
	
}
