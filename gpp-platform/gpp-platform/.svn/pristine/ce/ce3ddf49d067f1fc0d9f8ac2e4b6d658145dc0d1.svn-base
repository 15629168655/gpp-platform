package com.tbyf.service.gp.treatecase;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**治疗方案manage
 * @author zanxc
 * @创建日期2017年7月27日下午5:09:37
 */
public interface TreateCaseModelManager {

	/**治疗方案模板显示
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**
	 * 新增治疗方案模板
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**治疗方案模板编辑
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
	 * 批量删除治疗方案
	 * @param ids  选中删除的下标
	 * @throws Exception
	 */
	public void delAll(PageData pd )throws Exception;
	/**
	 * 更改执行的状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateCount(PageData pd )throws Exception;
}
