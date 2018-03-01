package com.tbyf.service.information.feedback;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface FeedbackManager {
		
	/**
	 * 意见反馈列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 处理意见反馈信息
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception;
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**
	 * app端提交意见
	 * @param pd
	 */
	public void Appsave(PageData pd) throws Exception;
	
	/**
	 * 通过TJRID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByTjrId(PageData pd) throws Exception;
}
