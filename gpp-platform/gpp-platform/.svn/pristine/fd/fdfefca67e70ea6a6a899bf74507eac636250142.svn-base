/**
 * 
 */
package com.tbyf.service.hm.regapp;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * @author LiuWenHao
 *
 */
public interface RegAppSManager {
	/** 排班信息列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**
	 * 通过id得到一条排班信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
	/**
	 * 保存医生排班信息
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception;
	/**
	 * 获得最大的GUID
	 * @return
	 * @throws Exception
	 */
	public PageData getMaxGUID(PageData pd) throws Exception;
	/**
	 * 更新医生的排班信息
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 判断是不是重复提交了
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData reSubmit(PageData pd)throws Exception;

}
