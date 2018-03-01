package com.tbyf.service.gp.inspect.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.gp.inspect.InspectManager;
import com.tbyf.util.*;

import org.springframework.stereotype.*;

import javax.annotation.*;

import java.util.*;

/** 
 * 说明： 检验
 * 创建人：zhangy
 * 创建时间：2016-10-09
 * @version
 */
@Service("inspectService")
public class InspectService implements InspectManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("InspectMapper.querylistPage", page);
	}
	public void delete(PageData PG)throws Exception{
		dao.delete("InspectMapper.delete", PG);
	}
	@Override
	public void saveObj(PageData pd)throws Exception{
		dao.save("InspectMapper.saveObj", pd);
	}
	@Override
	public PageData queryDataById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("InspectMapper.queryDataById", pd);
	}
	@Override
	public void editObj(PageData pd)throws Exception{
		dao.update("InspectMapper.editObj", pd);
	}
	@Override
	public void editSta(PageData pd)throws Exception{
		dao.update("InspectMapper.editSta", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryMZJZlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("InspectMapper.queryMZJZlistPage", page);
	}
	@Override
	public PageData queryMZJZByID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("InspectMapper.queryMZJZByID", pd);
	}
}

