package com.tbyf.service.hm.agreementApply.impl;

import com.tbyf.dao.*;
import com.tbyf.entity.enums.EnumAgreementApply;
import com.tbyf.entity.enums.EnumShbj;
import com.tbyf.service.hm.agreementApply.AgreementApplyManager;
import com.tbyf.util.*;

import org.springframework.stereotype.*;

import javax.annotation.*;

import java.util.*;

/** 
 * 说明： 预签约申请
 * 创建人：zhangy
 * 创建时间：2016-09-13
 * @version
 */
@Service("agreementApplyService")
public class AgreementApplyService implements AgreementApplyManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void addOrder(PageData pd)throws Exception{
		dao.save("AgreementApplyMapper.addOrder", pd);
	}
	
	/**
	 * APP分页查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AgreementApplyMapper.queryPage", pd);
	}
	
	/**
	 * 预签约申请审核
	 */
	@Override
	public void updateObject(PageData pd) throws Exception {
		/**
		 * 通过审核标记联动状态
		 * 审核通过后STATUS要变成1，
		 * 如果是拒绝的话，STATUS要变成退回
		 */
		String shbj = pd.getString("SHBJ");
		if(shbj.equals(EnumShbj.PASS.getCode().toString())) {			//审核标记通过  0
			pd.put("STATUS",EnumAgreementApply.PASS.getCode().toString()); //状态通过  1
		}else if(shbj .equals(EnumShbj.BACK.getCode().toString())){		//审核标记退回 1
			pd.put("STATUS", EnumAgreementApply.BACK.getCode().toString());	//状态 拒绝 2
		}
		dao.update("AgreementApplyMapper.edit", pd);
	}
	
	/**
	 * 通过ID获取数据
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("AgreementApplyMapper.findById", pd);
	}
}

