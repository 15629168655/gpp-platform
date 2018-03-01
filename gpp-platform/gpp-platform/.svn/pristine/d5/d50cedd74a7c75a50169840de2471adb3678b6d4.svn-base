package com.tbyf.service.gp.mzjzjl;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：门诊就诊记录接口
 * 创建人：lizk
 * 创建时间：2016-10-09
 * @version
 */
public interface MzjzjlManager {

	/**门诊就诊记录列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**通过门诊就诊记录表的患者ID获取流水号
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByPersonid(PageData pd) throws Exception;

	void save(PageData pd) throws Exception;
}
