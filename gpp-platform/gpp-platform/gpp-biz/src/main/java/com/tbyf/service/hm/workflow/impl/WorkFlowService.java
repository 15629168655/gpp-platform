package com.tbyf.service.hm.workflow.impl;

import com.tbyf.dao.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.workflow.*;
import com.tbyf.util.*;
import org.springframework.stereotype.*;

import javax.annotation.*;
import java.util.*;

/** 
 * 说明： 业务流程
 * 创建人：
 * 创建时间：2016-06-30
 * @version
 */
@Service("workflowService")
public class WorkFlowService implements WorkFlowManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("WorkFlowMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("WorkFlowMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("WorkFlowMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("WorkFlowMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("WorkFlowMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("WorkFlowMapper.findById", pd);
	}

	/**通过SIGN_ORG_CODE获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findBySIGN_ORG_CODE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("WorkFlowMapper.findBySIGN_ORG_CODE", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("WorkFlowMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

