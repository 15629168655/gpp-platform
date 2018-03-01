package com.tbyf.service.gp.gmpatient.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.gmpatient.GmpatientManager;
import com.tbyf.util.PageData;

@Service("gmpatientService")
public class GmpatientService implements GmpatientManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GmpatientMapper.datalistPage", page);
	}
	
	/**
	 * 新增患者信息
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("GmpatientMapper.save",pd);
	}
	
	/**
	 * 修改患者信息
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("GmpatientMapper.edit",pd);
		
	}
	/**
	 * 通过ID获取数据
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("GmpatientMapper.findById", pd);
	}
	
	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("GmpatientMapper.delete",pd);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("GmpatientMapper.deleteAll", ArrayDATA_IDS);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("GmpatientMapper.queryPage", pd);
	}

	@Override
	public void saveGmPatientApp(PageData pd) throws Exception {
		pd.put("ID", UUID.randomUUID().toString());
		dao.save("GmpatientMapper.saveApp", pd);
	}

	@Override
	public void delGmPatientApp(PageData pd) throws Exception {
		dao.delete("GmpatientMapper.delApp", pd);
	}

	@Override
	public void editGmPatientApp(PageData pd) throws Exception {
		dao.update("GmpatientMapper.editApp", pd);
	}
	
	
	
}
