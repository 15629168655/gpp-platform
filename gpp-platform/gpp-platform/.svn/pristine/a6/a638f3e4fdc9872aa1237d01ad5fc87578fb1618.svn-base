package com.tbyf.service.gp.mzjzjl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzjzjl.MzjzjlManager;
import com.tbyf.util.PageData;

/** 
 * 说明：门诊就诊记录
 * 创建人：lizk
 * 创建时间：2016-10-09
 * @version
 */
@Service("mzjzjlService")
public class MzjzjlService implements MzjzjlManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MzjzjlMapper.datalistPage", page);
	}
	
	/**通过门诊就诊记录表的患者ID获取流水号
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByPersonid(PageData pd) throws Exception {
		return (PageData) dao.findForObject("MzjzjlMapper.findByPersonid", pd);
	}
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("MzjzjlMapper.save", pd);
	}
}
