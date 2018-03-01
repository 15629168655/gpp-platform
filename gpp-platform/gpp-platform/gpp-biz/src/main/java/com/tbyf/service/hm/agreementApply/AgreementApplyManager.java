package com.tbyf.service.hm.agreementApply;

import com.tbyf.plugin.*;
import com.tbyf.util.*;

import java.util.*;

/** 
 * 说明： 预签约申请接口
 * 创建人：zhangy
 * 创建时间：2016-09-13
 * @version
 */
public interface AgreementApplyManager{

	/**新增预签约申请
	 * @param pd
	 * @throws Exception
	 */
	public void addOrder(PageData pd)throws Exception;
	
	/**
	 * 分页查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**
	 * 审核
	 * @param pd
	 * @throws Exception
	 */
	public void updateObject(PageData pd)throws Exception;
	/**
	 * 查询详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
}

