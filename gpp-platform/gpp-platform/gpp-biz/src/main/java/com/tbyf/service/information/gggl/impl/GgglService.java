package com.tbyf.service.information.gggl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.gggl.GgglManager;
import com.tbyf.util.PageData;

@Service("ggglService")
public class GgglService implements GgglManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * APP广告管理查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("GgglMapper.queryPage", pd);
	}
	
	/**
	 * 列表
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("GgglMapper.datalistPage", page);
	}
	
	/**
	 * 保存
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("GgglMapper.save", pd);
		
	}
	
	/**
	 * 编辑
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("GgglMapper.edit", pd);
		
	}
	
	/**
	 * 通过ID获取数据
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		 return (PageData) dao.findForObject("GgglMapper.findById", pd);
	}
	
	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("GgglMapper.delete", pd);
		
	}
	
	/**删除图片
	 * @param pd
	 * @throws Exception
	 */
	public void delTp(PageData pd)throws Exception{
		dao.update("GgglMapper.delTp", pd);
	}
}
