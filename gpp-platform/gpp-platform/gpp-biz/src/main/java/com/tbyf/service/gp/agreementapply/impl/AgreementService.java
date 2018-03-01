package com.tbyf.service.gp.agreementapply.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumAgreementApply;
import com.tbyf.entity.enums.EnumShbj;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.agreementapply.AgreementManager;
import com.tbyf.util.PageData;


@Service("agreementService")
public class AgreementService implements AgreementManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAllys(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AgreementMapper.datalistPage",page);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("AgreementMapper.save", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */	
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AgreementMapper.findById", pd);
	}
	
	/**查看
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
			/**
			 * 通过审核标记联动状态
			 * 审核通过后STATUS要变成1，
			 * 如果是拒绝的话，STATUS要变成退回
			 */
//			String shbj = pd.getString("SHBJ");
//			if(shbj.equals(EnumShbj.PASS.getCode().toString())) {			//审核标记通过  0
//				pd.put("STATUS",EnumAgreementApply.PASS.getCode().toString()); //状态通过  1
//			}else if(shbj .equals(EnumShbj.BACK.getCode().toString())){		//审核标记退回 1
//				pd.put("STATUS", EnumAgreementApply.BACK.getCode().toString());	//状态 拒绝 2
//			}
			dao.update("AgreementMapper.edit", pd);
		}
	
	/**
	 * 删除
	 * 更新状态为作废
	 */
	Integer eaD = EnumAgreementApply.INVALID.getCode();//作废
	@Override
	public void delete(PageData pd) throws Exception {
		pd.put("STATUS", eaD);
		dao.update("AgreementMapper.delete", pd);
	}

	@Override
	public List<PageData> listData(Page page) throws Exception {
		 return (List<PageData>)dao.findForList("AgreementMapper.yslistPage",page);
	}
	
}
