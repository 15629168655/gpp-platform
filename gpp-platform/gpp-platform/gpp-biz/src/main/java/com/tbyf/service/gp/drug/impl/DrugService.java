package com.tbyf.service.gp.drug.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.gp.drug.Drug;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.drug.DrugManager;
import com.tbyf.util.PageData;

/**
 * 药品明细表
 * @author lizk
 *2016-09-28
 */
@Service("drugService")
public class DrugService implements DrugManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**药品明细列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("DrugMapper.datalistPage", page);
	}
	
	/**列出所有药品
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Drug> listAllDrugs(PageData pd) throws Exception {
		return (List<Drug>) dao.findForList("DrugMapper.listAllDrugs", pd);
	}

}
