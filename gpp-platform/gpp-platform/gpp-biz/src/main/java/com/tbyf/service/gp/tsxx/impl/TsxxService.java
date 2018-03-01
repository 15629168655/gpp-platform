package com.tbyf.service.gp.tsxx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.tsxx.TsxxManager;
import com.tbyf.util.PageData;

/** 
 * 说明：推送消息
 * 创建人：lizk
 * 创建时间：2017-02-22
 * @version
 */
@Service("tsxxService")
public class TsxxService implements TsxxManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**推送消息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TsxxMapper.datalistPage", page);
	}
	
	/**保存推送消息
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("TsxxMapper.save", pd);
	}
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("TsxxMapper.findById", pd);
	}

	/**每次查看时浏览量+1
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void updateLLL(PageData pd) throws Exception {
		dao.update("TsxxMapper.updateLLL", pd);
	}

	/**点赞量+1
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void updateDZL(PageData pd) throws Exception {
		dao.update("TsxxMapper.updateDZL", pd);
	}
	
	/**
	 * APP推送消息列表查询接口
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("TsxxMapper.queryPage", pd);
	}
}
