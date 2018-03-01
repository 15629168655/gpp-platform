package com.tbyf.service.gp.jcwstx;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 基层卫生提醒接口
 * @author lizk
 *2016-09-23
 */
public interface JcwstxManager {

	/**
	 * 基层卫生提醒列表
	 * @return
	 */
	public List<PageData> list(Page page)throws Exception; 
	
	/**
	 * 新增
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
	
	/**修改状态（0：未读，1：已读，9：删除）
	 * @param pd
	 * @throws Exception
	 */
	public void editZT(PageData pd)throws Exception;
	
	/**单条标记为未读
	 * @param pd
	 * @throws Exception
	
	public void unRead(PageData pd)throws Exception;
	 */
	/**批量标记为已读
	 * @param IDS
	 * @throws Exception
	
	public void readAll(String[] IDS)throws Exception;
	*/
	/**批量标记为未读
	 * @param IDS
	 * @throws Exception
	 
	public void unReadAll(String[] IDS)throws Exception;
	 */
	/**app接口查询查询
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> appjcwstxlist(PageData pd)throws Exception;
	
	
}
