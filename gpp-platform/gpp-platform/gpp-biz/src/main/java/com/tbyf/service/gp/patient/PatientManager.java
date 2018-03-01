package com.tbyf.service.gp.patient;

import java.util.List;

import com.tbyf.entity.gp.patient.Patient;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;


/** 患者信息接口
 * 创建时间：2016.9.13
 * 作者：聂方
 */

public interface PatientManager {
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列出所有患者信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Patient> listAllPatients(PageData pd) throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**保存患者信息
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改患者信息
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**删除患者信息
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**批量删除患者信息
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS)throws Exception;
	
	/**app查询(分页)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**app新增
	 * @param pd
	 * @throws Exception
	 */
	//public void addPatient(PageData pd)throws Exception;

}
