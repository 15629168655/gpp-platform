package com.tbyf.service.gp.ysfl;

import java.util.List;

import com.tbyf.entity.gp.Ysfl;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：元素分类接口
 * 创建人：lizk
 * 创建时间：2016-10-19
 * @version
 */
public interface YsflManager {

	/**
	 * @param PId
	 * @return
	 * @throws Exception
	 */
	public List<Ysfl> listSubMenuByParentId(Page page)throws Exception;
	
	/**
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMenuById(PageData pd) throws Exception;
	
	/**
	 * @param ysfl
	 * @throws Exception
	 */
	public void saveMenu(Ysfl ysfl) throws Exception;
	
	/**
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findMaxId(PageData pd) throws Exception;
	
	/**
	 * @param ID
	 * @throws Exception
	 */
	public void deleteMenuById(String ID) throws Exception;
	
	/**
	 * @param ysfl
	 * @throws Exception
	 */
	public void edit(Ysfl ysfl) throws Exception;
	
	/**
	 * @param pd
	 * @return
	 * @throws Exception
	 
	public PageData editicon(PageData pd) throws Exception;
	*/
	/**
	 * @param ID
	 * @return
	 * @throws Exception
	 */
	public List<Ysfl> treeData(String ID) throws Exception; 
	public List<Ysfl> treeData1(String ID) throws Exception; 
	
	/**列出所有元素分类
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Ysfl> listAllYsfl(PageData pd) throws Exception;
	

}
