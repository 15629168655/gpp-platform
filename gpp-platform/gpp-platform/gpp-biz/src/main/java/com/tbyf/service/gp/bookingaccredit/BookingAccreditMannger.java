package com.tbyf.service.gp.bookingaccredit;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;
/**
 * 预约授权管理
 * @author zanxc
 *
 */
public interface BookingAccreditMannger {

	/**查询上级医生授权
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * 更改授权的状态
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增授权
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	/**
	 * 通过ID获取指标
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
}
