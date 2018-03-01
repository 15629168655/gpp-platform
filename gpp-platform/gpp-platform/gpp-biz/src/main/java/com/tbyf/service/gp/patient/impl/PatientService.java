package com.tbyf.service.gp.patient.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.gp.patient.Patient;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.patient.PatientManager;
import com.tbyf.util.PageData;


/** 患者信息管理
 * 创建时间：2016.9.13
 * 作者：聂方
 */

@Service("patientService")
public class PatientService  implements PatientManager {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PatientMapper.patientlistPage", page);
	}
	
	/**列出所有患者信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Patient> listAllPatients(PageData pd) throws Exception {
		return (List<Patient>) dao.findForList("PatientMapper.listAllPatients", pd);
	}
	
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PatientMapper.findById", pd);
	}
	
	/**保存患者信息
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PatientMapper.save", pd);
	}
	
	/**修改患者信息
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PatientMapper.edit", pd);
	}
	
	/**删除患者信息
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PatientMapper.delete", pd);
	}
	
	/**批量删除
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS)throws Exception{
		dao.delete("PatientMapper.deleteAll", IDS);
	}
	
	/**app查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PatientMapper.queryPage", pd);
	}
	
	/**app新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	//public void addPatient(PageData pd)throws Exception{
	//	dao.save("PatientMapper.addPatient", pd);
	//}

}
