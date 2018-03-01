package com.tbyf.service.gp.mobilecode.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.service.gp.mobilecode.MobileCodeManager;
import com.tbyf.util.PageData;
/** 
 * 说明：手机验证码表
 * 创建人：wuml
 * 创建时间：2017-02-07
 * @version
 */
@Service("mobileCodeService")
public class MobileCodeService implements MobileCodeManager {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/**
	 * 查询300秒有效的验证码
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findMobileCodeBy300Time(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("MobileCodeMapper.findMobileCodeBy300Time", pd);
	}
	/**
	 * 查询60秒内是否发过验证码
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findMobileCodeBy60Time(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("MobileCodeMapper.findMobileCodeBy60Time", pd);
	}

	/**
	 * 新增手机验证码
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.findForObject("MobileCodeMapper.save", pd);
	}

}
