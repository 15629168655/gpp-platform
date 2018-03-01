package com.tbyf.service.information.notice;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 信息管理-通知公告
 * @author lh
 *
 */
public interface NoticeManager {
	
	/**App通知公告查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**
	 * 通知公告列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增通知公告
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改通知公告
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
}
