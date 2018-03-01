package com.tbyf.service.gp.sftemp;

import java.util.List;
import java.util.Map;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：随访模版接口
 * 创建人：liwb
 * 创建时间：2017-8-3
 * @version
 */
public interface SfTempManager {

	/**新增随访模版
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 通过GUID查询随访模版详情
	 * @param pd
	 * @return
	 */
	public PageData findByGUID(PageData pd) throws Exception;
	
	/**修改随访模版
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**删除随访模版
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**根据TEMP_ID删除随访模版明细
	 * @param pd
	 * @throws Exception
	 */
	public void deteteDetailByTEMP_ID(PageData pd)throws Exception;
	
	/**查询随访模版列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * 新增随访模版明细
	 * @param pd
	 * @throws Exception
	 */
	public void saveTempDetail(PageData pd) throws Exception;

}
