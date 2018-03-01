
/**
 * @Project		hmp-biz
 * @File		DistrictManager.java
 * @Package		com.tbyf.service.system.district
 * @Version		V1.0
 * @Date		2016年6月15日 上午11:35:55
 * @Author		LiuWenHao
 * Copyright (c) All Rights Reserved, 2016.
 */
	
package com.tbyf.service.system.district;

import java.util.List;

import com.tbyf.entity.system.District;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * @Description	TODO
 * @ClassName	DistrictManager
 * @Date		2016年6月15日 上午11:35:55
 * @Author		LiuWenHao
 * Copyright (c) All Rights Reserved, 2016.
 */

public interface DistrictManager {

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	/**
	 * 通过上级行政区划获取其子级列表
	 * @param sjxzqh
	 * @return
	 * @throws Exception
	 */
	public List<District> listSubDistBySjxzqh(String sjxzqh) throws Exception;
	/**
	 * 
	 * @param guid
	 * @return
	 * @throws Exception
	 */
	public List<District> listSubDistByFid(String guid) throws Exception;
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param sjxzqh
	 * @return
	 * @throws Exception
	 */
	public List<District> listAllDist(String sjxzqh) throws Exception;
	/**
	 * 排查表检查是否被占用
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findFromTbs(PageData pd)throws Exception;
	/**
	 * 无点击url树
	 * @param sjxzqh
	 * @return
	 * @throws Exception
	 */
	public List<District> packageTreeDate(String sjxzqh) throws Exception;
	/**
	 * 有点急Url树
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<District> getDisTree(String id) throws Exception ;
	/**
	 * 通过级次查区划
	 * @param financelevel
	 * @return
	 * @throws Exception
	 */
	public List<District> queryDistrictByLevel(String financelevel) throws  Exception;
	
	/**
	 * 排查表检查是否被占用
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getAppDisTree(PageData pd)throws Exception;
	
	/**
	 * 通过级次查区划
	 * @param financelevel
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryAppDistrictByLevel(String financelevel) throws  Exception;
	
}
