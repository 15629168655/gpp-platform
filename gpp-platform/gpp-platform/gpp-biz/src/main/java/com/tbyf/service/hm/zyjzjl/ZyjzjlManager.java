package com.tbyf.service.hm.zyjzjl;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 住院就诊记录接口
 * @author lizk
 * 2016-10-24
 *
 */
public interface ZyjzjlManager {

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 */
	public PageData findByID(PageData pd) throws Exception;
	
	/**
	 * 通过PERSONID获取数据
	 * @param pd
	 * @return
	 */
	public PageData findByPERSONID(PageData pd) throws Exception;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**通过医疗机构代码获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByYLJGDM(PageData pd)throws Exception;
	
	/**
	 * 批量保存数据集
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public String saveListBatch(List<PageData> list)throws Exception;
	
}
