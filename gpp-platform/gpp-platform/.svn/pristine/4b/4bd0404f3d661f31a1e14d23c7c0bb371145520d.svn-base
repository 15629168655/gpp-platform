package com.tbyf.service.gp.mzbl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzbl.MzblManager;
import com.tbyf.util.PageData;


/** 
 * 说明：门诊病历
 * 创建人：lizk
 * 创建时间：2017-02-14
 * @version
 */
@Service("mzblService")
public class MzblService implements MzblManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public void save(PageData pd)throws Exception{
		dao.save("MzblMapper.save", pd);
	}
	
	/**患者门诊病历列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MzblMapper.datalistPage", page);
	}
	
	/**删除门诊病历
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("MzblMapper.delete", pd);
	}
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findByID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("MzblMapper.findByID", pd);
	}
	
	/**修改门诊病历
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("MzblMapper.edit", pd);
	}
	
}
