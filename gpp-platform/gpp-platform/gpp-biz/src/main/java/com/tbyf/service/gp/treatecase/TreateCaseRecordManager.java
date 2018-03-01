package com.tbyf.service.gp.treatecase;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;
/**
 * 治疗方案保存
 * @author zanxc
 * @创建日期2017年7月27日下午5:28:32
 */
public interface TreateCaseRecordManager {

	/**
	 * 治疗记录的保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception;
	/**
	 * 通过治疗的方案ID治疗的记录
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByCaseId(Page page) throws Exception;
	/**
	 * 查询治疗的记录
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dataRecord(Page page) throws Exception;
	/**
	 * 查询居民已经完成的治疗方案
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findFinished(PageData pd)throws Exception;
	
}
