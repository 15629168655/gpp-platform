package com.tbyf.service.hm.referral.impl;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.referral.ReferralManager;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/** 
 * 说明： 转诊申请
 * 创建人：
 * 创建时间：2016-06-16
 * @version
 */
@Service("referralService")
public class ReferralService implements ReferralManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("ReferralMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("ReferralMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("ReferralMapper.edit", pd);
	}

	/**接诊修改
	* @param pd
	* @throws Exception
	*/
	@Override
	public void edit3(PageData pd)throws Exception{
		dao.update("ReferralMapper.edit3", pd);
	}
	
	/**就诊确诊修改
	* @param pd
	* @throws Exception
	*/
	@Override
	public void edit4(PageData pd)throws Exception{
		dao.update("ReferralMapper.edit4", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ReferralMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ReferralMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ReferralMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ReferralMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 转诊审核
	 * @param pd
	 * @throws Exception
	 */
	public void approval(PageData pd) throws  Exception{
		dao.update("ReferralMapper.approval", pd);
	}

	/**
	 * 根据转出机构筛选转入机构
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> listOrgs(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ReferralMapper.listOrgs", page);
	}

	/**
	 * 根据初步诊断查询优先显示的机构
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> listDiseases(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ReferralMapper.listDiseases", page);
	}

	/**
	 * 根据转入机构选择转入科室
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> listDepts(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ReferralMapper.listDepts", page);
	}

	/**
	 * 根据转入机构、科室信息选择医护人员
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> listProviders(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ReferralMapper.listProviders", page);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ReferralMapper.queryPage", pd);
	}
	
	@Override
	public PageData findByCardno(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ReferralMapper.findByCardno", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getDataForZT(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ReferralMapper.getDataForZT", pd);
	}
	
	public String getApplyStatusInString(String queryApplyStatus, Map<Integer, String> enumApplyStatus){
		StringBuffer sbf = new StringBuffer();
		if(Tools.isEmpty(queryApplyStatus)||queryApplyStatus.equals("-1")){
			int i = enumApplyStatus.size();
			for(Map.Entry<Integer, String> entry:enumApplyStatus.entrySet()){
				i--;
				sbf.append("'").append(entry.getKey()).append("'");
				if(i!=0)sbf.append(",");
			}
		}else{
			sbf.append("'").append(queryApplyStatus).append("'");
		}
		return sbf.toString();
	}
}

