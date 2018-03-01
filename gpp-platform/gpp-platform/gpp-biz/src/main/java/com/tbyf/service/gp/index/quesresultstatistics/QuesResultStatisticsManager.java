package com.tbyf.service.gp.index.quesresultstatistics;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;
/**
 * 
 * @author zanxc
 *
 */
public interface QuesResultStatisticsManager {
	/**
	 * 问卷结果统计列表
	 */
	public List<PageData> SList(PageData pd)throws Exception;
	/**
	 * 医生的工作量的统计
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> viewDoctorWorkLoad(PageData pd)throws Exception;
	/**
	 * 显示医生的工作量的详情
	 */
	public List<PageData> findByDoctor(Page page)throws Exception;
	/**
	 * 疾病统计
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> diseaseMount(Page page)throws Exception;
	/**
	 * 疾病详情
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByDisease(Page page)throws Exception;
}
