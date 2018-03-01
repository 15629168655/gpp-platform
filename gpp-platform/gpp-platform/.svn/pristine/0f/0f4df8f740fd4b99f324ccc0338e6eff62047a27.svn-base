package com.tbyf.service.gp.sydj;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：输液登记接口
 * 创建人：lizk
 * 创建时间：2016-10-09
 * @version
 */
public interface SydjManager {

	/**输液登记列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
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
	public void edit(PageData pd)throws Exception;
	
	/**删除居民信息(协议状态改为9 ）
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;

	List<PageData> queryPage(PageData pd) throws Exception;
	
}
