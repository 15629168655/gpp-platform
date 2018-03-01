package com.tbyf.service.gp.mzzdwh.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzzdwh.MzzdwhManager;
import com.tbyf.util.PageData;

@Service("mzzdwhService")
public class MzzdwhService implements MzzdwhManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**诊断信息列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> zdxxlist(Page page) throws Exception {
		return (List<PageData>)dao.findForList("MzzdwhMapper.mzxxlistPage", page);
	}

	/**通过BM获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByBM(PageData pd) throws Exception {
		return (PageData)dao.findForObject("MzzdwhMapper.findByBM", pd);
	}

	/**保存新增门诊诊断
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveMzzd(PageData pd) throws Exception {
		dao.save("MzzdwhMapper.saveMzzd", pd);
		
	}

}
