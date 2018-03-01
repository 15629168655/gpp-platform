package com.tbyf.service.hm.summary;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：出院小结
 * @version
 */
public interface SummaryManager{

	public void save(PageData pd)throws Exception;
	

	PageData findById(PageData pd) throws Exception;



	List<PageData> queryPage(Page page) throws Exception;


	String saveListBatch(List<PageData> list) throws Exception;

}

