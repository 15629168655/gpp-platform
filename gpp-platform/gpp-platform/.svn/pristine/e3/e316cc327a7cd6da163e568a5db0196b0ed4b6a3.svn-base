package com.tbyf.service.gp.servicePack.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.servicePack.ServicePackManager;
import com.tbyf.util.PageData;

/**
 * 服务包
 * @author lizk
 *2016-11-17
 */
@Service("servicePackService")
public class ServicePackService implements ServicePackManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**服务包列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ServicePackMapper.datalistPage", page);
	}
	/**app接口服务包列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> querylistforApp(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ServicePackMapper.querylistforApp", pd);
	}
	
	
	/**服务包编码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> PackBM(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ServicePackMapper.PackBM", page);
	}
	
	/**新增服务包
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("ServicePackMapper.save", pd);
	}
	
	/**根据编码查询记录，录入时确保唯一
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByBM(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ServicePackMapper.findByBM", pd);
	}
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ServicePackMapper.findById", pd);
	}
	
	/**修改服务包
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("ServicePackMapper.edit", pd);
		
	}
	
	/**修改服务包状态
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.update("ServicePackMapper.delete", pd);
		
	}
}
