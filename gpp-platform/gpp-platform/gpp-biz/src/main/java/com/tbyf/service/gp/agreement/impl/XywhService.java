package com.tbyf.service.gp.agreement.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.xywh.XywhManager;
import com.tbyf.util.PageData;

/**
 * 
 * @author lizk
 * 2016-09-13
 *
 */
@Service("xywhService")
public class XywhService implements XywhManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列出协议信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAllxyxx(Page page) throws Exception {
		return (List<PageData>) dao.findForList("XywhMapper.xyxxlistPage", page);
	}

	@Override
	public void saveXywh(PageData pd) throws Exception {
		dao.save("XywhMapper.saveXywh", pd);
		
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("XywhMapper.findById", pd);
	}

	@Override
	public void editXywh(PageData pd) throws Exception {
		dao.update("XywhMapper.editXywh", pd);
		
	}
	
	/**修改协议状态为启用
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void qyXywh(PageData pd) throws Exception {
		dao.update("XywhMapper.qyXywh", pd);
		
	}

	/**删除协议信息(协议状态改为9 ）
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteXywh(PageData pd) throws Exception {
		dao.update("XywhMapper.deleteXywh", pd);
		
	}

	/**批量删除
	 * @param ids
	 * @throws Exception
	 */
	@Override
	public void deleteAllXywh(String[] ids) throws Exception {
		dao.update("XywhMapper.deleteAllXywh", ids);
		
	}

	/**批量删除时循环查询可删除的协议（只有保存状态才能删除）
	 * @param ids
	 * @throws Exception
	 */
	@Override
	public PageData findByIdArray(String[] ids) throws Exception {
		return (PageData)dao.findForObject("XywhMapper.findByIdArray", ids);
		
	}

	/**批量删除时循环查询出不可删除的协议（只有保存状态才能删除）
	 * @param ids
	 * @throws Exception
	 */
	@Override
	public PageData findByIdForName(String[]  unDelId) throws Exception {
		return (PageData)dao.findForObject("XywhMapper.findByIdForName", unDelId);
	}
	
	/**app接口查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> appXyxxlist(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("XywhMapper.appXyxxlist", pd);
	}

}
