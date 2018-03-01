package com.tbyf.service.gp.tsxx;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：推送消息接口
 * 创建人：lizk
 * 创建时间：2017-02-22
 * @version
 */
public interface TsxxManager {

	/**推送消息列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**保存推送消息
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
	
	/**每次查看时浏览量+1
	 * @param pd
	 * @throws Exception
	 */
	public void updateLLL(PageData pd)throws Exception;
	
	/**点赞量+1
	 * @param pd
	 * @throws Exception
	 */
	public void updateDZL(PageData pd)throws Exception;
	
	/**App推送消息列表查询接口
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
}
