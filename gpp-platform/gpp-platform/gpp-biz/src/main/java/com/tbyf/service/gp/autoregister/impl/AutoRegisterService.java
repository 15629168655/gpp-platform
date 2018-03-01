package com.tbyf.service.gp.autoregister.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.gp.autoregister.AutoRegisterManager;
import com.tbyf.util.*;

import org.springframework.stereotype.*;

import javax.annotation.*;

import java.util.*;

/** 
 * 说明： 自动挂号
 * 创建人：zhangy
 * 创建时间：2016-09-22
 * @version
 */
@Service("autoRegisterService")
public class AutoRegisterService implements AutoRegisterManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AutoRegisterMapper.querylistPage", page);
	}
	@Override
	public void saveObj(PageData pd)throws Exception{
		dao.save("AutoRegisterMapper.saveObj", pd);
	}
	@Override
	public void editObj(PageData pd)throws Exception{
		dao.update("AutoRegisterMapper.editObj", pd);
	}
	@Override
	public void editObject(PageData pd)throws Exception{
		dao.update("AutoRegisterMapper.editObject", pd);
	}
	@Override
	public PageData queryDataById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AutoRegisterMapper.findById", pd);
	}
	@Override
	public PageData queryPersonObjById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AutoRegisterMapper.findPersonObjById", pd);
	}
}

