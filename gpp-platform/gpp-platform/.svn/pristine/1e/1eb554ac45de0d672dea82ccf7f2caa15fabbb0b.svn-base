package com.tbyf.service.gp.bookingaccredit.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.bookingaccredit.BookingAccreditMannger;
import com.tbyf.util.PageData;
/**
 * 预约授权service
 * @author zanxc
 *
 */
@Service("bookingAccreditService")
public class BookingAccreditService implements BookingAccreditMannger{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询指标
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("BookingAccreditMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("BookingAccreditMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("BookingAccreditMapper.save", pd);
		
	}

	

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("BookingAccreditMapper.findById", pd);
	}
	
	/**
	 * app更新
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("BookingAccreditMapper.edit", pd);
		
	}
}
