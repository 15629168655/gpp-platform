package com.tbyf.service.gp.lcxmdzb.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.lcxmdzb.LcxmdzbManager;
import com.tbyf.util.PageData;

/** 
 * 说明：临床项目
 * 创建人：lizk
 * 创建时间：2017-02-07
 * @version
 */
@Service("lcxmdzbService")
public class LcxmdzbService implements LcxmdzbManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**临床项目对照表列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("LcxmdzbMapper.datalistPage", page);
	}
	
	/**删除临床项目对照表信息
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("LcxmdzbMapper.delete", pd);
	}
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("LcxmdzbMapper.findById", pd);
	}

	/**保存新增信息
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("LcxmdzbMapper.save", pd);
	}

	@Override
	public PageData findBySFXM(PageData pd) throws Exception {
		return (PageData) dao.findForObject("LcxmdzbMapper.findBySFXM", pd);
	}
	
	/**修改数量
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("LcxmdzbMapper.edit", pd);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> queryByBM(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("LcxmdzbMapper.queryByBM", pd);
	}
}
