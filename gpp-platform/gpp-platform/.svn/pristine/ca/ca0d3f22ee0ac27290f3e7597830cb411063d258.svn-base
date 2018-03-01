package com.tbyf.service.information.versionManage;

import java.util.List;
import java.util.Map;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 信息管理-版本管理
 * @author pengk
 *
 */
public interface VersionService {
	
	/**
	 * 版本管理列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	/**
	 * 新增版本管理
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	/**
	 * 修改版本管理
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	/**
	 * 版本管理删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	/**
	 * 通过id获取信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	/**
	 * 根据多个用户id查询用户
	 * @param map
	 * @return
	 */
	public  List<PageData> queryUserById(String[] DATA_ID) throws Exception;
	
	/**
	 * 根据id查询用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findToId(String  id)throws Exception;
	/**
	 * 批量删除数据
	 * @param pd
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
}
