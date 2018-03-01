package com.tbyf.service.gp.agreementsevice;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface AgreementseviceManager {
	
	/**
	 * 签约服务协议列表
	 * @return
	 */
	public List<PageData> list(Page page)throws Exception; 
	
	/**
	 * 签约变更管理列表
	 * @return
	 */
	public List<PageData> listChange(Page page)throws Exception; 
	
	/**
	 * 新增
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	public void editStatus(PageData pd)throws Exception;
	/**
	 * 通过ID获取信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void jieyue(PageData pd)throws Exception;
	
	/**续约
	 * @param pd
	 * @throws Exception
	 */
	public void renew(PageData pd)throws Exception;
	
	/**通过ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByRenewId(PageData pd)throws Exception;
	
	/**续约
	 * @param pd
	 * @throws Exception
	 */
	public void transfer(PageData pd)throws Exception;

	PageData findChangeApplyById(PageData pd) throws Exception;

	public void updateChangeApply(PageData changePd) throws Exception;

	List<PageData> logslistPage(Page page) throws Exception;

	void delApply(PageData pd) throws Exception;

	void updatetransfer(PageData pd) throws Exception;

	public List<PageData> queryPage(PageData pd)throws Exception;

	void delObject(PageData pd) throws Exception;

	void updateObject(PageData pd) throws Exception;

	void saveObj(PageData pd) throws Exception;
	
}
