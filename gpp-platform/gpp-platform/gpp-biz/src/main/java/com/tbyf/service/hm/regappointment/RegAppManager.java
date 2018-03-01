/**
 * 
 */
package com.tbyf.service.hm.regappointment;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * @author LiuWenHao
 *
 */
public interface RegAppManager {
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	/**
	 * 通过转诊ID查询挂号信息
	 */
	public PageData findByReferralID(PageData pd)throws Exception;
	/**
	 * 更新预约状态
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 通过ID查询预约的信息
	 */
	public PageData findById(PageData pd) throws Exception;
}
