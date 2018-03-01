package com.tbyf.service.hm.risReport;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 医学影像检查报告接口
 * @author lizk
 * 2016-10-27
 *
 */
public interface RisReportManager {

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 通过PERSONID获取数据
	 * @param pd
	 * @return
	 */
	public PageData findByPERSONID(PageData pd) throws Exception;
	
	/**通过医疗机构代码获取数据(接口用)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByYLJGDM(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 通过检查号--主键获取数据(用于查看详情)
	 * @param pd
	 * @return
	 */
	public PageData findBySTUDYUID(PageData pd) throws Exception;
	
	/**
	 * 批量保存数据集
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public String saveListBatch(List<PageData> list)throws Exception;
	
}
