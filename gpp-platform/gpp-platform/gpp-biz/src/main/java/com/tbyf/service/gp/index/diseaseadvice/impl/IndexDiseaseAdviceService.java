package com.tbyf.service.gp.index.diseaseadvice.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.diseaseadvice.IndexDiseaseAdviceManager;
import com.tbyf.util.PageData;

/**
 * IndexDiseaseAdviceMapper
 * @author zanxc
 *
 */
@Service("indexDiseaseAdviceService")
public class IndexDiseaseAdviceService implements IndexDiseaseAdviceManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询指标
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexDiseaseAdviceMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("IndexDiseaseAdviceMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("IndexDiseaseAdviceMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("IndexDiseaseAdviceMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexDiseaseAdviceMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("IndexDiseaseAdviceMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(String[] ids) throws Exception {
		dao.update("IndexDiseaseAdviceMapper.deleteAll", ids);
		
	}
	/**
	 * app更新血脂四项记录
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("IndexDiseaseAdviceMapper.renew", pd);
		
	}

	
	@Override
	public List<PageData> datalistCreate(Page page) throws Exception {
		return (List<PageData>)dao.findForList("IndexDiseaseAdviceMapper.datalistCreate", page);
	}
	

}
