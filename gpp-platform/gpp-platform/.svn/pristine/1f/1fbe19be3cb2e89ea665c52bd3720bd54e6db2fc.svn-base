package com.tbyf.service.information.healthinformation;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface HealthInformationManager {
	
	/**
	 * 健康资讯列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
		
	/**
	 * 健康资讯列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd) throws Exception;
	
	/**
	 * 发布健康资讯
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception;
	
	/**
	 * 编辑
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception;
	
	/**
	 * 增加浏览量
	 * @param num
	 * @throws Exception
	 */
	public void addLLL(PageData pd) throws Exception;
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
}
