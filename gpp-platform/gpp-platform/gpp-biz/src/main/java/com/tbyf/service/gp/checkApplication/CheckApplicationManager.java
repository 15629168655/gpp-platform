package com.tbyf.service.gp.checkApplication;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 检查申请表接口
 */
public interface CheckApplicationManager {
		
	/**App检查申请管理查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**App检查申请管理新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveCheckApp(PageData pd)throws Exception;
	
	/**App检查申请管理删除
	 * @param pd
	 * @throws Exception
	 */
	public void delCheckApp(PageData pd)throws Exception;
	
	/**App检查申请管理编辑
	 * @param pd
	 * @throws Exception
	 */
	public void editCheckApp(PageData pd)throws Exception;
		
	/**检查申请列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 编辑
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取某一行的数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**
	 * 删除 状态改为9
	 * @param pd
	 * @throws Exception
	 */
	public void del(PageData pd)throws Exception;
	
	/**
	 * 批量删除
	 * 状态改为9
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
}
