package com.tbyf.service.gp.agreementsevice.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.agreementsevice.AgreementseviceManager;
import com.tbyf.util.PageData;

@Service("agreementserviceService")
public class AgreementserviceService implements AgreementseviceManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AgreementServiceMapper.datalistPage", page);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> logslistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AgreementServiceMapper.logslistPage", page);
	}
	/** 变更管理列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listChange(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AgreementServiceMapper.changelistPage", page);
	}
	

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("AgreementServiceMapper.save", pd);
	}
	@Override
	public void saveObj(PageData pd)throws Exception{
		dao.save("AgreementServiceMapper.saveObj", pd);
	}
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("AgreementServiceMapper.edit", pd);
	}
	public void editStatus(PageData pd)throws Exception{
		dao.update("AgreementServiceMapper.editStatus", pd);
	}
	public void updateChangeApply(PageData pd)throws Exception{
		dao.update("AgreementServiceMapper.updateChangeApply", pd);
	}
	@Override
	public void delApply(PageData pd)throws Exception{
		dao.update("AgreementServiceMapper.delApply", pd);
	}
	@Override
	public void updatetransfer(PageData pd)throws Exception{
		dao.update("AgreementServiceMapper.updatetransfer", pd);
	}
	@Override
	public void updateObject(PageData pd)throws Exception{
		dao.update("AgreementServiceMapper.updateObject", pd);
	}
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */	
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AgreementServiceMapper.findById", pd);
	}
	@Override
	public PageData findChangeApplyById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AgreementServiceMapper.findChangeApplyById", pd);
	}
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("AgreementServiceMapper.delete", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("AgreementServiceMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 * 解约
	 */
	@Override
	public void jieyue(PageData pd) throws Exception {
		dao.update("AgreementServiceMapper.jieyue", pd);
	}
	
	/**
	 * 生成解约历史表
	 */
	@Override
	public void renew(PageData pd) throws Exception {
		dao.save("AgreementRenewMapper.save", pd);
	}


	/**通过ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByRenewId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AgreementRenewMapper.findByRenewId", pd);
	}
	
	/**
	 * 转签
	 */
	@Override
	public void transfer(PageData pd) throws Exception {
		dao.save("AgreementTransferMapper.save", pd);
	}
	/**
	 * APP分页查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AgreementServiceMapper.queryPage", pd);
	}
	@Override
	public void delObject(PageData pd) throws Exception {
		dao.update("AgreementServiceMapper.delObject", pd);
	}
}
