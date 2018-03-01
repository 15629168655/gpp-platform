package com.tbyf.service.hm.curedisease.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.curedisease.*;
import com.tbyf.util.*;
import org.springframework.stereotype.*;

import javax.annotation.*;
import java.util.*;

/** 
 * 说明： 主治疾病
 * 创建人：
 * 创建时间：2016-07-01
 * @version
 */
@Service("curediseaseService")
public class CureDiseaseService implements CureDiseaseManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("CureDiseaseMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("CureDiseaseMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("CureDiseaseMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CureDiseaseMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CureDiseaseMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CureDiseaseMapper.findById", pd);
	}

	/**通过DISEASE_CODE获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByDISEASE_CODE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CureDiseaseMapper.findByDISEASE_CODE", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CureDiseaseMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

