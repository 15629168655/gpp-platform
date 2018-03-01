
/**
 * @Project		hmp-biz
 * @File		DistrictManager.java
 * @Package		com.tbyf.service.system.district.impl
 * @Version		V1.0
 * @Date		2016年6月15日 下午12:00:12
 * @Author		LiuWenHao
 * Copyright (c) All Rights Reserved, 2016.
 */
	
package com.tbyf.service.system.district.impl;

import java.util.List;

import javax.annotation.Resource;

import com.tbyf.service.system.district.DistrictManager;
import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.system.District;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * @Description	TODO
 * @ClassName	DistrictManager
 * @Date		2016年6月15日 下午12:00:12
 * @Author		LiuWenHao
 * Copyright (c) All Rights Reserved, 2016.
 */
@Service("districtService")
public class DistrictService implements DistrictManager {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	/**
	 * 保存操作
	 */
	public void save(PageData pd) throws Exception {
		dao.save("DistrictMapper.save", pd);
	}
	/**
	 * 删除操作
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("DistrictMapper.delete", pd);
	}
	/**
	 * 更新操作
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("DistrictMapper.edit", pd);
	}
	/**
	 * 获取列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("DistrictMapper.datalistPage", page);
	}
	/**
	 * 通过id查询
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("DistrictMapper.findById", pd);
	}
	/**
	 * 通过sjxzqh获取其子级列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<District> listSubDistBySjxzqh(String sjxzqh) throws Exception {
		
		return (List<District>) dao.findForList("DistrictMapper.listSubDistBySjxzqhdm", sjxzqh);
	}
	 /**
	  * 有点击url树
	  */
	public List<District> packageTreeDate(String id) throws Exception {
		List<District> disList=this.listSubDistByFid(id);
		for(District dis : disList){
			if(dis.getFINANCELEVEL().equals("5")){
				dis.setUrl("district/goEdit.do?REGICODE="+dis.getREGICODE());
			}else {
				dis.setUrl("district/list.do?REGICODE="+dis.getREGICODE());
			}
			dis.setName(dis.getREGINAME());
			dis.setId(dis.getREGICODE());
			dis.setPId(id);
			
			//dis.setSubDist(this.listAllDist(dis.getXzqhdm()));
			dis.setTarget("treeFrame");
			if("5".equals(dis.getFINANCELEVEL())){
				dis.setIsParent(false);
			}else {
				dis.setIsParent(true);
			}
		}
		return disList;
	}
	/**
	 * 无点击url树
	 */
	public List<District> getDisTree(String id) throws Exception {
		List<District> disList=this.listSubDistByFid(id);
		for(District dis : disList){
			dis.setName(dis.getREGINAME());
			dis.setId(dis.getREGICODE());
			dis.setPId(id);
			
			//dis.setSubDist(this.listAllDist(dis.getXzqhdm()));
			dis.setTarget("treeFrame");
			if("5".equals(dis.getFINANCELEVEL())){
				dis.setIsParent(false);
			}else {
				dis.setIsParent(true);
			}
		}
		return disList;
	}

	public List<District> queryDistrictByLevel(String financelevel) throws Exception {
		return (List<District>) dao.findForList("DistrictMapper.queryDistrictByLevel", financelevel);
	}

	/**
	 * 通过上级id获取子列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<District> listSubDistByFid(String guid) throws Exception {
		return (List<District>) dao.findForList("DistrictMapper.listSubDistByFid", guid);
	}
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 */
	public List<District> listAllDist(String sjxzqh) throws Exception {
		List<District> disList=this.listSubDistBySjxzqh(sjxzqh);
		for(District dis : disList){
			dis.setTreeurl("district/list.do?REGICODE="+dis.getREGICODE());
			dis.setSubDist(this.listAllDist(dis.getREGICODE()));
			dis.setTarget("treeFrame");
		}
		return disList;
	}
	/**排查表检查是否被占用
	 */
	@Override
	public PageData findFromTbs(PageData pd) throws Exception {
		return (PageData) dao.findForObject("DistrictMapper.findFromTbs", pd);
	}
	/**
	 * 排查表检查是否被占用
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getAppDisTree(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("DistrictMapper.getAppDisTree", pd);
	}
	
	/**
	 * 通过级次查区划
	 * @param financelevel
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryAppDistrictByLevel(String financelevel) throws  Exception{
		return (List<PageData>) dao.findForList("DistrictMapper.queryAppDistrictByLevel",  financelevel);
	}
}
