package com.tbyf.service.gp.ysfl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.gp.Ysfl;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.ysfl.YsflManager;
import com.tbyf.util.PageData;

/** 
 * 说明：元素分类
 * 创建人：lizk
 * 创建时间：2016-10-19
 * @version
 */
@Service("ysflService")
public class YsflService implements YsflManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 通过ID获取其子一级菜单
	 * @param PId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Ysfl> listSubMenuByParentId(Page page) throws Exception {
		return (List<Ysfl>) dao.findForList("YsflMapper.listSubMenuByParentIdlistPage", page);
	}
	
	/**
	 * 通过菜单ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMenuById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("YsflMapper.getMenuById", pd);
	}
	
	/**
	 * 新增菜单
	 * @param ysfl
	 * @throws Exception
	 */
	public void saveMenu(Ysfl ysfl) throws Exception {
		dao.save("YsflMapper.insertMenu", ysfl);
	}
	
	/**
	 * 取最大ID
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findMaxId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("YsflMapper.findMaxId", pd);
	}
	
	/**
	 * 删除菜单
	 * @param ID
	 * @throws Exception
	 */
	public void deleteMenuById(String ID) throws Exception {
		dao.save("YsflMapper.deleteMenuById", ID);
	}
	
	/**
	 * 编辑
	 * @param ysfl
	 * @return
	 * @throws Exception
	 */
	public void edit(Ysfl ysfl) throws Exception {
		 dao.update("YsflMapper.updateMenu", ysfl);
	}
	
	/**
	 * 保存菜单图标 
	 * @param pd
	 * @return
	 * @throws Exception
	
	public PageData editicon(PageData pd) throws Exception {
		return (PageData)dao.findForObject("YsflMapper.editicon", pd);
	} */
	
	/**
	 * 获取菜单列表(菜单管理)
	 * @param _ID
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Ysfl> treeData(String ID) throws Exception {
		List<Ysfl> ysfl=(List<Ysfl> )dao.findForList("YsflMapper.treeData", ID);
		for(Ysfl ysfls : ysfl){
			
			ysfls.setUrl("ysfl/list.do?ID="+ysfls.getID());
			
			ysfls.setName(ysfls.getMC());
			ysfls.setId(ysfls.getID());
			ysfls.setPId(ID);
			
			//dis.setSubDist(this.listAllDist(dis.getXzqhdm()));
			ysfls.setTarget("treeFrame");
			
			ysfls.setIsParent(true);
			
		}
		return ysfl;
//		return (List<Ysfl> )dao.findForList("YsflMapper.treeData", ID);
	} 
	
	/**列出所有元素分类
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Ysfl> listAllYsfl(PageData pd) throws Exception {
		return (List<Ysfl>) dao.findForList("YsflMapper.listAllYsfl", pd);
	}
	@SuppressWarnings("unchecked")
	public List<Ysfl> treeData1(String ID) throws Exception {
		List<Ysfl> ysfl=(List<Ysfl> )dao.findForList("YsflMapper.treeData", ID);
		for(Ysfl ysfls : ysfl){
			ysfls.setName(ysfls.getMC());
			ysfls.setId(ysfls.getID());
			ysfls.setPId(ID);
			ysfls.setTarget("treeFrame");
			ysfls.setIsParent(true);
		}
		return ysfl;
	} 


}
