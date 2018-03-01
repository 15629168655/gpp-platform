package com.tbyf.service.gp.payservice.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.system.Dictionaries;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.payservice.PayServiceManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;

import com.tbyf.util.PageData;

@Service("payservice")
public class PayServiceservice implements PayServiceManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name = "dictionariesService")
	private DictionariesManager dictionariesService;
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("payservicetMapper.paylistPage", page);
	}
	
	/**
	 * 新增
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("payservicetMapper.save",pd);
	}
	
	/**
	 * 修改
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("payservicetMapper.edit",pd);
	}
	
	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("payservicetMapper.delete",pd);
	}
	
	/**
	 * 批量删除
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("payservicetMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 通过ID获取数据
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("payservicetMapper.findById", pd);
	}
	
	public List<Dictionaries> treeData(String parentId) throws Exception{
		@SuppressWarnings("unchecked")
		List<Dictionaries> dic=(List<Dictionaries> )dao.findForList("DictionariesMapper.listSubDictByParentId", parentId);
		for(Dictionaries dics : dic){
			
			dics.setTreeurl("payservice/list.do?ID="+dics.getBIANMA());
			dics.setNAME(dics.getNAME());
			dics.setDICTIONARIES_ID(dics.getDICTIONARIES_ID());
			dics.setPARENT_ID(parentId);
			dics.setTarget("treeFrame");
			//dics.setIsParent(true);
			if(dictionariesService.listAllDict(dics.getDICTIONARIES_ID()).size() != 0 && dictionariesService.listAllDict(dics.getDICTIONARIES_ID()) != null) {
				dics.setSubDict(dictionariesService.listAllDict(dics.getDICTIONARIES_ID()));
			}
			dics.setHasDict(true);
			
		}
		return dic;
	}
	

}
