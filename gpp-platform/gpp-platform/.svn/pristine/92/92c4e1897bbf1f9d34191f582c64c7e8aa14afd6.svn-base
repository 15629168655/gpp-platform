package com.tbyf.service.gp.element.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.element.ElementManager;
import com.tbyf.util.PageData;

/** 电子病历 元素
 * 创建时间：2016.10.19
 * 作者：聂方
 */

@Service("elementService")
public class ElementService implements ElementManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ElementMapper.elementlistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ElementMapper.findById", pd);
	}
	@SuppressWarnings("unchecked")
	public  List<PageData> findByYSFLID(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ElementMapper.findByYSFLID", pd);
	}
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("ElementMapper.save", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("ElementMapper.edit", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("ElementMapper.delete", pd);
	}
	
	/**批量删除
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS)throws Exception{
		dao.delete("ElementMapper.deleteAll", IDS);
	}

}
