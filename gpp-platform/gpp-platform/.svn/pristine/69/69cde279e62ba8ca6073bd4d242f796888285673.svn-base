package com.tbyf.service.information.feedback.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.feedback.FeedbackManager;
import com.tbyf.util.PageData;

@Service("feedbackService")
public class FeedbackService implements FeedbackManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
		
	
	/**
	 * 意见反馈列表信息
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("FeedbackMapper.datalistPage", page);
	}
	
	/**
	 * 处理意见反馈信息
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("FeedbackMapper.edit",pd);
		
	}
	
	/**
	 * 通过ID获取数据信息
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("FeedbackMapper.findById", pd);
	}

	@Override
	public void Appsave(PageData pd) throws Exception {
		dao.save("FeedbackMapper.Appsave", pd);
		
	}
	
	/**
	 * 通过提交人ID查询健康资讯
	 */
	@Override
	public List<PageData> findByTjrId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		 return (List<PageData>)dao.findForList("FeedbackMapper.findByTjrId", pd);
	}
	
	
}
