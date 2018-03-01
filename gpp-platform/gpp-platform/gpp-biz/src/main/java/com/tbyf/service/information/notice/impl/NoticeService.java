package com.tbyf.service.information.notice.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.notice.NoticeManager;
import com.tbyf.util.PageData;

/**
 * 信息管理-通知公告
 * @author lh
 *
 */
@Service("noticeService")
public class NoticeService implements NoticeManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * APP通知公告查询
	 * 状态为启用 修改时间倒序显示
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
	    return (List<PageData>) dao.findForList("NoticeMapper.queryPage", pd);
	}

	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("NoticeMapper.datalistPage", page);
	}

	@Override
	public void save(PageData pd) throws Exception {
		dao.save("NoticeMapper.save", pd);
		
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("NoticeMapper.edit", pd);
		
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("NoticeMapper.findById", pd);
	}

	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("NoticeMapper.delete", pd);
		
	}
	
	
}
