package com.tbyf.service.gp.injection.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.injection.InjectionManager;
import com.tbyf.util.PageData;

/** 注射登记管理
 * 创建时间：2016.10.8
 * 作者：聂方
 */
@Service("injectionService")
public class InjectionService implements InjectionManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("InjectionMapper.injectionlistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("InjectionMapper.findById", pd);
	}


	/**批量获取
	 * @param ArrayDATA_IDS
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getAllById(String[] ArrayDATA_IDS)throws Exception{
		return (List<PageData>)dao.findForList("InjectionMapper.getAllById", ArrayDATA_IDS);
	}
	
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("InjectionMapper.save", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("InjectionMapper.edit", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("InjectionMapper.delete", pd);
	}
	
	
	/**批量删除
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS)throws Exception{
		dao.delete("InjectionMapper.deleteAll", IDS);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("InjectionMapper.queryPage", pd);
	}

	@Override
	public void saveInjectionApp(PageData pd) throws Exception {
		pd.put("ID", UUID.randomUUID().toString());
		pd.put("ZT", "0");
		dao.save("InjectionMapper.saveApp", pd);
	}

	@Override
	public void editInjectionApp(PageData pd) throws Exception {
		dao.update("InjectionMapper.editApp", pd);
	}

}
