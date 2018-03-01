package com.tbyf.service.gp.jbzd;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明： 疾病字典接口
 * 创建人：lizk
 * 创建时间：2016-09-21
 * @version
 */
public interface JbzdManager {

	/**查询疾病字典列表，用于显示在点击新增时的选取页面
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> jbzdlist(Page page)throws Exception;
	
	/**通过编码获取数据（用于写入门诊诊断表）
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByBM(PageData pd)throws Exception;
}
