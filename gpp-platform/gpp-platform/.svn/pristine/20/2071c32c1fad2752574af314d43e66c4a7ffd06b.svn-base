package com.tbyf.service.gp.skintest.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.skintest.SkintestManager;
import com.tbyf.util.PageData;

/** 皮试管理
 * 创建时间：2016.9.29
 * 作者：聂方
 */

@Service("skintestService")
public class SkintestService implements SkintestManager{
	
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SkintestMapper.skintestlistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SkintestMapper.findById", pd);
	}


	/**批量获取
	 * @param ArrayDATA_IDS
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getAllById(String[] ArrayDATA_IDS)throws Exception{
		return (List<PageData>)dao.findForList("SkintestMapper.getAllById", ArrayDATA_IDS);
	}
	
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("SkintestMapper.save", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("SkintestMapper.edit", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("SkintestMapper.delete", pd);
	}
	
	
	/**批量删除
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS)throws Exception{
		dao.delete("SkintestMapper.deleteAll", IDS);
	}
	
	/**app查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SkintestMapper.queryPage", pd);
	}
	
	/**app新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	//public void addSkintest(PageData pd)throws Exception{
	//	dao.save("SkintestMapper.addSkintest", pd);
	//}

}
