
package com.tbyf.service.hm.regapp.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.regapp.RegAppSManager;
import com.tbyf.util.PageData;

/**排班表信息调用接口
 * @author LiuWenHao
 *
 */
@Service("regAppSService")
public class RegAppSService implements RegAppSManager {
	//注入dao 
	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 列出所有医生的排班
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("RegAppSMapper.list", page);
	}

	/**
	 * 通过ID获得医生的排班信息
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("RegAppSMapper.findById", pd);
	}

	/**@author zanxc
	 * 保存医生的排班信息
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("RegAppSMapper.save", pd);
		
	}

	/**
	 * 获得最大的GUID
	 */
	@Override
	public PageData getMaxGUID(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("RegAppSMapper.getMaxGUID", pd);
	}

	/**
	 * 更新排班信息表
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("RegAppSMapper.update", pd);
		
	}

	@Override
	public PageData reSubmit(PageData pd) throws Exception {
		
		return (PageData)dao.findForObject("RegAppSMapper.reSubmit", pd);
	}
	

	
}
