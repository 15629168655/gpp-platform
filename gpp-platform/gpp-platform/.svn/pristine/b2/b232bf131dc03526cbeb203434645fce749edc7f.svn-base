package com.tbyf.service.hm.diseasecode.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.diseasecode.*;
import com.tbyf.util.*;
import org.springframework.stereotype.*;

import javax.annotation.*;
import java.util.*;

/** 
 * 说明： 疾病编码
 * 创建人：
 * 创建时间：2016-06-16
 * @version
 */
@Service("diseasecodeService")
public class DiseaseCodeService implements DiseaseCodeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("DiseaseCodeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("DiseaseCodeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("DiseaseCodeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("DiseaseCodeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DiseaseCodeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DiseaseCodeMapper.findById", pd);
	}

	/**通过疾病编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByDiseaseCode(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DiseaseCodeMapper.findByDiseaseCode", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("DiseaseCodeMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

