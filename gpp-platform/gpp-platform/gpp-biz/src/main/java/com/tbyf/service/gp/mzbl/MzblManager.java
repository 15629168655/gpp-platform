package com.tbyf.service.gp.mzbl;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 门诊病历接口
 * @author lizk
 * 2017-02-14
 */
public interface MzblManager {

	/**
	 * 新增门诊病历
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 患者门诊病历列表
	 * @param pd
	 * @return
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**删除诊病历
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 */
	public PageData findByID(PageData pd) throws Exception;
	
	/**修改诊病历
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	
}
