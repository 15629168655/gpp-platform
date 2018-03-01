package com.tbyf.service.gp.bloodsugar.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.gp.bloodsugar.BloodSugarManager;
import com.tbyf.util.*;

import org.springframework.stereotype.*;

import javax.annotation.*;

import java.util.*;

/** 
 * 说明： 门诊测血糖
 * 创建人：zhangy
 * 创建时间：2016-09-23
 * @version
 */
@Service("bloodSugarService")
public class BloodSugarService implements BloodSugarManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BloodSugarMapper.querylistPage", page);
	}
	public void delete(PageData PG)throws Exception{
		dao.delete("BloodSugarMapper.delete", PG);
	}
	@Override
	public void saveObj(PageData pd)throws Exception{
		dao.save("BloodSugarMapper.saveObj", pd);
	}
	@Override
	public PageData queryDataById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BloodSugarMapper.queryDataById", pd);
	}
	@Override
	public void editObj(PageData pd)throws Exception{
		dao.update("BloodSugarMapper.editObj", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BloodSugarMapper.queryPage", pd);
	}
}

