package com.tbyf.service.hm.interfaceinfo.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.interfaceinfo.InterfaceInfoManager;
import com.tbyf.util.PageData;

/** 
 * 说明： 接口信息管理
 * 创建人：
 * 创建时间：2016-07-06
 * @version
 */
@Service("interfaceinfoService")
public class InterfaceInfoService implements InterfaceInfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("InterfaceInfoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("InterfaceInfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("InterfaceInfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("InterfaceInfoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("InterfaceInfoMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("InterfaceInfoMapper.findById", pd);
	}
	
	/**通过接口名称获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByInterName(PageData pd)throws Exception{
		return (PageData)dao.findForObject("InterfaceInfoMapper.findByInterName", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("InterfaceInfoMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

