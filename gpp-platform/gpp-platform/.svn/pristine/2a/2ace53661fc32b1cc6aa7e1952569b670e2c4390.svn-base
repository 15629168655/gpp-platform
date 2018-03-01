package com.tbyf.service.gp.jmxx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.gp.resident.Jmxx;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.util.PageData;

/**
 * 
 * @author lizk
 * 2016-09-03
 *
 */
@Service("jmxxService")
public class JmxxService implements JmxxManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列出辖区居民信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAlljmxx(Page page) throws Exception {
		return (List<PageData>) dao.findForList("JmxxMapper.jmxxlistPage", page);
	}
	
	
	/**列出此组下级角色
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Jmxx> listAllJmxxs(PageData pd) throws Exception {
		return (List<Jmxx>) dao.findForList("JmxxMapper.listAllJmxxs", pd);
	}

	@Override
	public PageData jmxxByMi_card(PageData pd) throws Exception {
		return (PageData) dao.findForObject("JmxxMapper.jmxxByMi_card", pd);
	}

	@Override
	public PageData jmxxByIdcard(PageData pd) throws Exception {
		return (PageData) dao.findForObject("JmxxMapper.jmxxByIdcard", pd);
	}

	@Override
	public void saveU(PageData pd) throws Exception {
		dao.save("JmxxMapper.saveU", pd);
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("JmxxMapper.findById", pd);
	}

	@Override
	public void editJmxx(PageData pd) throws Exception {
		dao.update("JmxxMapper.editJmxx", pd);
		
	}
	@Override
	public void editJmtx(PageData pd) throws Exception {
		dao.update("JmxxMapper.editJmtx", pd);
		
	}
	@Override
	public void editJmxxSign(PageData pd) throws Exception{
		dao.update("JmxxMapper.editJmxxSign", pd);
	}

	@Override
	public void deleteJmxx(PageData pd) throws Exception {
		dao.update("JmxxMapper.deleteJmxx", pd);
		
	}
	@Override
	public void saveForApp(PageData pd) throws Exception {
		dao.save("JmxxMapper.saveForApp", pd);
	}
	@Override
	public void editPW(PageData pd) throws Exception {
		dao.update("JmxxMapper.editPW", pd);
		
	}
	@Override
	public PageData findByTel(PageData pd) throws Exception {
		return (PageData) dao.findForObject("JmxxMapper.findByTel", pd);
	}
	@Override
	public PageData findUserInfoById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("JmxxMapper.findUserInfoById", pd);
	}
	
	@Override
	public void editForApp(PageData pd) throws Exception {
		dao.update("JmxxMapper.editForApp", pd);
		
	}

	/**
	 * 居民登陆查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByLoginInfo(PageData pd) throws Exception{
		return (PageData) dao.findForObject("JmxxMapper.findByLoginInfo", pd);
	}
	/**
	 * 居民搜索分页查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> jmxxlistforApp(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("JmxxMapper.jmxxlistforApp", pd);
	}


	/**
	 * 居民诊断
	 */
	@Override
	public void jmdis(PageData pd) throws Exception {
		dao.update("JmxxMapper.dis", pd);
	}
}
