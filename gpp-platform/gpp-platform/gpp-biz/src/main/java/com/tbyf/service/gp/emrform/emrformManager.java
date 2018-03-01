package com.tbyf.service.gp.emrform;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface emrformManager {
	/**
	 * 模板管理列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 模板管理新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 模板管理编辑
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 模板管理删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 模板管理列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	void editForm(PageData pd) throws Exception;
}
