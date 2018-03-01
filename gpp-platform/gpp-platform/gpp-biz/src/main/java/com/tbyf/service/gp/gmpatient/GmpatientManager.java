package com.tbyf.service.gp.gmpatient;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface GmpatientManager {
	
	/**teamApp过敏管理查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**teamApp过敏管理新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveGmPatientApp(PageData pd)throws Exception;
	
	/**teamApp过敏管理删除
	 * @param pd
	 * @throws Exception
	 */
	public void delGmPatientApp(PageData pd)throws Exception;
	
	/**teamApp过敏管理编辑
	 * @param pd
	 * @throws Exception
	 */
	public void editGmPatientApp(PageData pd)throws Exception;
	
	/**
	 * 患者过敏信息列表
	 * @return
	 */
	public List<PageData> list(Page page)throws Exception; 
	
	/**
	 * 新增过敏患者信息 
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改过敏患者信息 
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
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
}
