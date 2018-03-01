package com.tbyf.service.gp.blfyypgl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.blfyypgl.BlfyypglManager;
import com.tbyf.util.PageData;

/**
 * 不良反应药品管理
 * @author lizk
 *2016-09-28
 */
@Service("blfyypglService")
public class BlfyypglService implements BlfyypglManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BlfyypglMapper.datalistPage", page);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("BlfyypglMapper.save", pd);
	}
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BlfyypglMapper.findById", pd);
	}
	
	/**修改信息
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("BlfyypglMapper.edit", pd);
		
	}
	
	/**删除居民信息(协议状态改为9 ）
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.update("BlfyypglMapper.delete", pd);
		
	}
	
	/**app接口查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> appDatalist(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BlfyypglMapper.appDatalist", pd);
	}
	
}
