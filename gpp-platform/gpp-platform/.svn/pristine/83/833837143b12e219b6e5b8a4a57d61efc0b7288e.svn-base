package com.tbyf.service.gp.jbzd.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jbzd.JbzdManager;
import com.tbyf.util.PageData;

@Service("jbzdService")
public class JbzdService implements JbzdManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**查询疾病字典列表，用于显示在点击新增时的选取页面
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> jbzdlist(Page page) throws Exception {
		return (List<PageData>)dao.findForList("JbzdMapper.jbzdlistPage", page);
	}

	/**通过编码获取数据（用于写入门诊诊断表）
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByBM(PageData pd) throws Exception {
		return (PageData)dao.findForObject("JbzdMapper.findByBM", pd);
	}

}
