package com.tbyf.service.gp.hospitalization.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.hospitalization.HospitalizationManager;
import com.tbyf.util.PageData;

/** 住院证管理
 * 创建时间：2016.9.26
 * 作者：聂方
 */

@Service("hospitalizationService")
public class HospitalizationService implements HospitalizationManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("HospitalizationMapper.hospitalizationlistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HospitalizationMapper.findById", pd);
	}
	
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("HospitalizationMapper.save", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("HospitalizationMapper.edit", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("HospitalizationMapper.delete", pd);
	}
	
	/**批量获取
	 * @param ArrayDATA_IDS
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getAllById(String[] ArrayDATA_IDS)throws Exception{
		return (List<PageData>)dao.findForList("HospitalizationMapper.getAllById", ArrayDATA_IDS);
	}
	
	/**批量删除
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS)throws Exception{
		dao.delete("HospitalizationMapper.deleteAll", IDS);
	}
	

	/**app查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("HospitalizationMapper.queryPage", pd);
	}
	
	/**app新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	//public void addHospitalization(PageData pd)throws Exception{
	//	dao.save("HospitalizationMapper.addHospitalization", pd);
	//}

}
