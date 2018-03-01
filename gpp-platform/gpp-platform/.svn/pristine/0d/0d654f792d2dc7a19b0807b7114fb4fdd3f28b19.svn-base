package com.tbyf.service.hm.referral;

import java.util.List;
import java.util.Map;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明： 转诊申请接口
 * 创建人：
 * 创建时间：2016-06-16
 * @version
 */
public interface ReferralManager{

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

	/**接诊修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit3(PageData pd)throws Exception;
	
	/**就诊确诊修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit4(PageData pd)throws Exception;


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
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	/**
	 * 审核
	 * @param pd
	 * @throws Exception
	 */
	public void approval(PageData pd) throws  Exception;

	/**
	 *  根据转出机构筛选转入机构
	 * @param page
	 * @return
	 */
	public List<PageData> listOrgs(Page page)throws  Exception;

	/**
	 * 根据初步诊断查询优先显示的机构
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listDiseases(Page page) throws Exception;

	/**
	 * 根据转入机构选择转入科室
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listDepts(Page page) throws  Exception;

	/**
	 * 根据转入机构、科室信息选择医护人员
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listProviders(Page page) throws  Exception;

	List<PageData> queryPage(PageData pd) throws Exception;

	PageData findByCardno(PageData pd) throws Exception;

	List<PageData> getDataForZT(PageData pd) throws Exception;
	
	/**
	 * 拼装审核状态查询条件
	 * @param queryApplyStatus
	 * @param enumApplyStatus
	 * @return
	 */
	public String getApplyStatusInString(String queryApplyStatus, Map<Integer, String> enumApplyStatus);
}

