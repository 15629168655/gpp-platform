package com.tbyf.service.gp.treatecase;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 公卫医生执行治疗方案
 * @author zanxc
 * @创建日期2017年7月27日下午5:32:17
 */
public interface TreateCaseManager {

	/**
	 * 治疗方案显示
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 保存治疗方案
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**治疗方案编辑
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID治疗方案
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除治疗方案
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 批量删除治疗方案的执行记录
	 * @param ids  选中删除的下标
	 * @throws Exception
	 */
	public void delAll(PageData pd )throws Exception;
	/**
	 * 通过治疗方案模板ID查询治疗方案
	 */
	public List<PageData> findByModelId(PageData pd)throws Exception;
	/**
	 * 改变执行的状态
	 */
	public void changeState(PageData pd)throws Exception;
	/**
	 * 改变治疗执行的次数
	 */
	public void changCaseCount(PageData pd)throws Exception;
	/**
	 * 通过居民ID查询治疗方案
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByResidentId(PageData pd)throws Exception;
	
	
}
