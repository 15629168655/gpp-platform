package com.tbyf.service.hm.yhry.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.hm.Yhry;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.yhry.YhryManager;
import com.tbyf.util.PageData;

/**
 * 医护人员
 * @author Administrator
 *
 */
@Service("yhryService")
public class YhryService implements YhryManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("YhryMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("YhryMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("YhryMapper.edit", pd);
	}
	
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> yhrylist(Page page)throws Exception{
		return (List<PageData>)dao.findForList("YhryMapper.dataYhrylistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("YhryMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */	
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("YhryMapper.findById", pd);
	}
	
	/**通过医护人员id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByProviderId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("YhryMapper.findByProviderId", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("YhryMapper.deleteAll", ArrayDATA_IDS);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Yhry> listSubYhryByParentId(String parentId) throws Exception {
		return (List<Yhry>) dao.findForList("YhryMapper.listSubYhryByParentId", parentId);
	}

	@Override
	public List<PageData> dataCaseYhry(Page page) throws Exception {
		return (List<PageData>)dao.findForList("YhryMapper.dataCase", page);
	}
	
}