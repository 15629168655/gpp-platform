package com.tbyf.service.hm.lisIndicators.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.lisIndicators.LisIndicatorsManager;
import com.tbyf.util.PageData;


/** 检验结果指标
 * 创建时间：2016.10.27
 * 作者：聂方
 */

@Service("lisIndicatorsService")
public class LisIndicatorsService implements LisIndicatorsManager {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("LisIndicatorsMapper.listPage", page);
	}
	
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("LisIndicatorsMapper.findById", pd);
	}
	
	/**app查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("LisIndicatorsMapper.queryPage", pd);
	}
	
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("LisIndicatorsMapper.save", pd);
	}
	
	/**实验室报告跳转至相应的检查结果标准list
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listbybgdh(Page page)throws Exception{
		return (List<PageData>)dao.findForList("LisIndicatorsMapper.listbybgdh", page);
	}

}
