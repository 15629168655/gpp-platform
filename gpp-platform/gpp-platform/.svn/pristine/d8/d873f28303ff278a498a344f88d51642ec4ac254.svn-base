package com.tbyf.service.hm.devicepush.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.service.hm.devicepush.DevicePushManager;
import com.tbyf.util.PageData;
/**
 * 设备推送设置
 * @author zanxc
 * @创建日期2017年8月11日上午10:54:31
 */
@Service("devicePushService")
public class DevicePushService implements DevicePushManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public void saveDevice(PageData pd) throws Exception {
		dao.save("DevicePushMapper.saveDevice", pd);
	}

	@Override
	public PageData findByDeviceID(PageData pd) throws Exception {
		return (PageData)dao.findForObject("DevicePushMapper.findByDeviceID", pd);
	}

	@Override
	public PageData findByUserID(PageData pd) throws Exception {
		return (PageData)dao.findForObject("DevicePushMapper.findByUserID", pd);
		
	}

	@Override
	public List<PageData> findByUserType(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("DevicePushMapper.findByUserType", pd);
		
	}

	@Override
	public List<PageData> findByDeviceType(PageData pd) throws Exception {
		return(List<PageData>)dao.findForList("DevicePushMapper.findByDeviceType", pd);
		
	}

	@Override
	public void saveAnotherDevice(PageData pd) throws Exception {
		dao.save("DevicePushMapper.saveAnotherDevice.", pd);
		
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("DevicePushMapper.edit", pd);
		
	}

	@Override
	public void emptyUserId(PageData pd) throws Exception {
		dao.update("DevicePushMapper.emptyUserId", pd);
	}

}
