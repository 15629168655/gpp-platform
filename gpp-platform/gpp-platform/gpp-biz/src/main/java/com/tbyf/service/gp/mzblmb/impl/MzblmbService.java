package com.tbyf.service.gp.mzblmb.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzblmb.MzblmbManager;
import com.tbyf.util.PageData;

/** 
 * 说明：门诊病历模板
 * 创建人：lizk
 * 创建时间：2017-02-14
 * @version
 */
@Service("mzblmbService")
public class MzblmbService implements MzblmbManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MzblmbMapper.datalistPage", page);
	}
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findByID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("MzblmbMapper.findByID", pd);
	}
	
	/**修改门诊病历模板
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("MzblmbMapper.edit", pd);
	}
	
	/**删除门诊病历模板
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("MzblmbMapper.delete", pd);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("MzblmbMapper.save", pd);
	}
}
