package com.tbyf.service.hm.lisReport;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 实验室检验报告表头 接口类
 * 创建时间：2016.10.26
 * 作者：聂方
 */
public interface LisReportManager {
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**app查询(分页)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 批量保存数据集
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public String saveListBatch(List<PageData> list)throws Exception;

}
