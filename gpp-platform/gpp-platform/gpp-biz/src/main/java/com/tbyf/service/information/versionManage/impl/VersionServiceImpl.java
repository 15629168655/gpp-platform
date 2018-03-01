package com.tbyf.service.information.versionManage.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.versionManage.VersionService;
import com.tbyf.util.PageData;

@Service("versionService")
public class VersionServiceImpl implements VersionService{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("VersionMapper.datalistPage", page);
	}

	@Override
	public void save(PageData pd) throws Exception {
		dao.save("VersionMapper.save", pd);
	}

	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("VersionMapper.delete", pd);
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("VersionMapper.findById", pd);
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("VersionMapper.edit", pd);
	}

	@Override
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("VersionMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> queryUserById(String[] DATA_ID) throws Exception{
		return  (List<PageData>) dao.findForList("AppuserMapper.queryUserById",DATA_ID);
	}

	@Override
	public PageData findToId(String id) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.queryUserToId", id);
	}


}
