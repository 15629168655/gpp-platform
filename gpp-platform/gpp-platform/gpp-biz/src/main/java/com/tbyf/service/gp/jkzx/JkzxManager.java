package com.tbyf.service.gp.jkzx;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：健康咨询
 * 创建人：zhangy
 * 创建时间：2017-02-27
 * @version
 */
public interface JkzxManager {
	
	public List<PageData> list(Page page)  throws Exception;
	/**
	 * app查询健康咨询列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listForApp(PageData pd) throws Exception;
	void save(PageData pd) throws Exception;
	public void delete(PageData PG)throws Exception;
	public List<PageData> findContent(PageData pd)throws Exception;
	void editObj(PageData pd) throws Exception;
	void saveContent(PageData pd) throws Exception;
	public List<PageData> findById(PageData pd)throws Exception;

}
