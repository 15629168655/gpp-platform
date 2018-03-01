package com.tbyf.service.gp.treatecase.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.treatecase.TreateCaseRecordManager;
import com.tbyf.util.PageData;
/**
 * 治疗方案诊断
 * @author zanxc
 * @创建日期2017年7月27日下午5:30:50
 */
@Service("treateCaseRecordService")
public class TreateCaseRecordService implements TreateCaseRecordManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("TreateRecordMapper.save", pd);
		
	}
	/**
	 * 通过方案ID查询治疗的记录
	 */
	public List<PageData> findByCaseId(Page page)throws Exception {
		return(List<PageData>)dao.findForList("TreateRecordMapper.findByCaseId", page);
		
	}
	@Override
	public List<PageData> dataRecord(Page page) throws Exception {
		return(List<PageData>)dao.findForList("TreateRecordMapper.dataRecord", page);
	}
	@Override
	public List<PageData> findFinished(PageData pd) throws Exception {
		return(List<PageData>)dao.findForList("TreateRecordMapper.findFinished", pd);
	}
}
