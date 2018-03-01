package com.tbyf.service.information.healthinformation;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface HealthInformationTypeManager {
	
	/**
	 * 健康资讯类型列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增健康资讯时选取资讯类型
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> typeSelect(PageData pd) throws Exception;
		
	/**
	 * 健康资讯类型列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd) throws Exception;
	
	/**
	 * 添加健康资讯类型
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
	 * 通过GUID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByGUID(PageData pd) throws Exception;
	
	/**
	 * 通过GUID删除数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void deleteByGUID(PageData pd) throws Exception;

}
