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
public interface RegAppDocManager {
	/**医生信息列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**
	 * 通过guid得到医生信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	/**
	 * 医院的科室列表
	 */
	public List<PageData> listKS(Page page)throws Exception;
	/**
	 * 通过医生编码和医院编码得到医生的信息
	 */
	public PageData findByHospitialCodeAndDoctorCode(PageData pd)throws Exception;
	/***医生预约信息保存
	 * 
	 */
	public void save(PageData pd)throws Exception;
	/***
	 * 获得最大的GUID
	 */
	public PageData getMaxGUID(PageData pd)throws Exception;
	/**
	 * 更新医生的预约信息
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception;
	/**
	 * 显示所有的医生详情
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
}
