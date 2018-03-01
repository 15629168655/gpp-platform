package com.tbyf.service.gp.mzcfmx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzcfmx.MzcfmxManager;
import com.tbyf.util.PageData;

/** 
 * 说明：门诊处方明细
 * 创建人：lizk
 * 创建时间：2016-10-09
 * @version
 */
@Service("mzcfmxService")
public class MzcfmxService implements MzcfmxManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MzcfmxMapper.datalistPage", page);
	}
	
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("MzcfmxMapper.save", pd);
	}
}
