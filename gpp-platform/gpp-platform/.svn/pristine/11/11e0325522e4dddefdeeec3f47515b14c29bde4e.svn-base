package com.tbyf.service.gp.bloodPressure;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 门诊测血压接口
 * @author lizk
 *2016-09-26
 */
public interface BloodPressureManager {
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**修改信息
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 删除
	 * @param pg
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception;
	
	/**app接口查询查询
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> appDatalist(PageData pd)throws Exception;

}
