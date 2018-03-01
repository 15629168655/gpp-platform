package com.tbyf.service.hm.devicepush;

import java.util.List;

import com.tbyf.util.PageData;

/**
 * 消息推送设置manager
 * @author zanxc
 * @创建日期2017年8月11日上午10:45:48
 */
public interface DevicePushManager {

	/**保存设备信息
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void saveDevice(PageData pd)throws Exception;
	/**通过设备Id查询推送
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByDeviceID(PageData pd)throws Exception;
	/**通过用户Id查询推送
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByUserID(PageData pd)throws Exception;
	/**通过用户类型查询推送
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByUserType(PageData pd)throws Exception;
	/**通过设备类型查询推送
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByDeviceType(PageData pd)throws Exception;
	/**通过多用户保存的问题查询推送
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void saveAnotherDevice(PageData pd)throws Exception;
	/**
	 * 通过设备ID更新推送设置
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception;
	/**
	 * 清空账号信息
	 * @param pd
	 * @throws Exception
	 */
	public void emptyUserId(PageData pd) throws Exception;
}
