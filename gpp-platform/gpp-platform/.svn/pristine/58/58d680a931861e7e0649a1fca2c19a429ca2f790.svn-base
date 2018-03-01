package com.tbyf.service.gp.lcxm.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.gp.Lcxm;
import com.tbyf.entity.system.Dictionaries;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.lcxm.LcxmManager;
import com.tbyf.service.gp.lcxmdzb.LcxmdzbManager;
import com.tbyf.util.PageData;

/** 
 * 说明：临床项目
 * 创建人：lizk
 * 创建时间：2017-02-07
 * @version
 */
@Service("lcxmService")
public class LcxmService implements LcxmManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name = "lcxmdzbService")
	private LcxmdzbManager lcxmdzbService;
	/***
	 * 通过父PID找到子子编码，
	 */
	/**
	 * 获取菜单列表(菜单管理)
	 * @param _ID
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Lcxm> treeData(String ID) throws Exception {
		List<Lcxm> Lcxm=(List<Lcxm> )dao.findForList("LcxmMapper.treeData", ID);
		for(Lcxm Lcxms : Lcxm){
			
			Lcxms.setUrl("lcxm/list.do?BM="+Lcxms.getBM());
			Lcxms.setName(Lcxms.getMC());
			Lcxms.setID(Lcxms.getID());
			Lcxms.setPID(ID);
			Lcxms.setTarget("treeFrame");
			Lcxms.setIsParent(true);//判断是不父节点
				//PageData pd = new PageData();
				//pd.put("ID", Lcxms.getBM());
				//lcxmdzbService.findBySFXM(pd);
			
		}
		return Lcxm;
	} 
	
	/**新增临床项目菜单
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("LcxmMapper.save", pd);
	}
	
	/**
	 * 取最大ID
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findMaxId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("LcxmMapper.findMaxId", pd);
	}
	
	/**
	 * 通过菜单ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("LcxmMapper.findById", pd);
	}
	
	/**修改临床项目菜单
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("LcxmMapper.edit", pd);
	}
	
	/**删除临床项目菜单
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("LcxmMapper.delete", pd);
	}

	@Override
	public PageData findByBM(PageData pd) throws Exception {
		return (PageData) dao.findForObject("LcxmMapper.findByBM", pd);
	}
	
	/**收费项目树状列表
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Dictionaries> goTreeData(String ID) throws Exception{
		List<Dictionaries> dic=(List<Dictionaries> )dao.findForList("DictionariesMapper.listSubDictByParentId", ID);
		for(Dictionaries dics : dic){
			dics.setTreeurl("lcxm/sfxmlist.do?BM="+dics.getBIANMA());
			dics.setNAME(dics.getNAME());
			dics.setDICTIONARIES_ID(dics.getDICTIONARIES_ID());
			dics.setPARENT_ID(ID);
			dics.setTarget("treeFrame");
			dics.setHasDict(true);
		}
		return dic;
	}
	
	@SuppressWarnings("unchecked")
	public List<PageData> getParentMenu(PageData pd) throws Exception {
		List<PageData> Lcxm=(List<PageData>) dao.findForList("LcxmMapper.getParentMenu", pd);
		return Lcxm;
	} 
	
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("LcxmMapper.listSubMenuByParentIdlistPage", page);
	}

	@SuppressWarnings("unchecked")
	public List<Lcxm> findByPID(String PID) throws Exception {
		
		return (List<Lcxm>)dao.findForList("LcxmMapper.treeData", PID);
	}
}
