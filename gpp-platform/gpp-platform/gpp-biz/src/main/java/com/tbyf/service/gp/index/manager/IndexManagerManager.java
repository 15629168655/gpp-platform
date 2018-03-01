package com.tbyf.service.gp.index.manager;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;
/**
 * 指标管理
 * @author zanxc
 *
 */
public interface IndexManagerManager {
	/**指标查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * app更新指标管理
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 指标查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增指标
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改指标
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取指标
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除指标
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 批量删除
	 * @param ids  选中删除的下标
	 * @throws Exception
	 */
	public void delAll(PageData pd )throws Exception;

}
