package com.tbyf.service.gp.xywh;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 协议维护
 * @author lizk
 * 2016-09-13
 */
public interface XywhManager {

	/**列出协议信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllxyxx(Page page) throws Exception;
	
	/**保存新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveXywh(PageData pd)throws Exception;
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**修改信息
	 * @param pd
	 * @throws Exception
	 */
	public void editXywh(PageData pd)throws Exception;
	
	/**修改协议为启用状态
	 * @param pd
	 * @throws Exception
	 */
	public void qyXywh(PageData pd)throws Exception;
	
	/**删除协议信息(协议状态改为9 ）
	 * @param pd
	 * @throws Exception
	 */
	public void deleteXywh(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ids
	 * @throws Exception
	 */
	public void deleteAllXywh(String[] ids)throws Exception;
	
	/**批量删除时循环查询出可删除的协议（只有保存状态才能删除）
	 * @param ids
	 * @throws Exception
	 */
	public PageData findByIdArray(String[] ids)throws Exception;
	
	/**批量删除时循环查询出不可删除的协议（只有保存状态才能删除）
	 * @param unDelId
	 * @throws Exception
	 */
	public PageData findByIdForName(String[]  unDelId)throws Exception;
	
	/**app接口查询查询
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> appXyxxlist(PageData pd)throws Exception;
	
}
