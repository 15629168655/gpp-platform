package com.tbyf.service.hm.regapp.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.regapp.RegAppDocManager;
import com.tbyf.util.PageData;

@Service("regAppDocService")
public class RegAppDocService implements RegAppDocManager {
	//注入dao
	@Resource(name="daoSupport")
	private DaoSupport dao;
	/**
	 * 显示预约信息的列表
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("RegAppDocMapper.datalistPage", page);
	}
	/**
	 * 通过ID查询医生的预约信息
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("RegAppDocMapper.findById", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	/**查询医生所在医院的全部科室
	 * 
	 */
	public List<PageData> listKS(Page page) throws Exception {
		
		return (List<PageData>) dao.findForList("RegAppDocMapper.listKS", page);
	}

	/**通过医院编码和医生编码查询医生的信息
	 * 
	 */
	@Override
	public PageData findByHospitialCodeAndDoctorCode(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("RegAppDocMapper.findByHospitialCodeAndDoctorCode", pd);
	}

	/**医生预约的信息保存
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("RegAppDocMapper.save", pd);
		
	}
	/**
	 * 获得最大的GUID
	 */
	@Override
	public PageData getMaxGUID(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("RegAppDocMapper.maxGUID", pd);
	}
	@Override
	/**
	 * 更新医生的预约信息
	 */
	public void update(PageData pd) throws Exception {
		dao.update("RegAppDocMapper.update", pd);
		
	}
	@Override
	public List<PageData> listAll(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return  (List<PageData>) dao.findForList("RegAppDocMapper.listAll", pd);
	}
	
}
