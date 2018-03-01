package com.tbyf.service.gp.mzblmb;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 门诊病历模板接口
 * @author lizk
 * 2017-02-14
 */
public interface MzblmbManager {

	/**
	 * 诊病历模板列表
	 * @param pd
	 * @return
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 */
	public PageData findByID(PageData pd) throws Exception;
	
	/**修改诊病历模板
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**删除诊病历模板
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 新增门诊病历模板
	 */
	public void save(PageData pd)throws Exception;
}
