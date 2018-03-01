package com.tbyf.service.gp.payservice;

import java.util.List;

import com.tbyf.entity.system.Dictionaries;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface PayServiceManager {
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception;
	
	/**
	 * 通过ID获取信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * @param ID
	 * @return
	 * @throws Exception
	 */
	public List<Dictionaries> treeData(String ID) throws Exception;
}
