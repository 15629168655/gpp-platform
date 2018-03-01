package com.tbyf.service.gp.sfjl;

import java.util.List;
import java.util.Map;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：随访记录接口
 * 创建人：lizk
 * 创建时间：2016-10-12
 * @version
 */
public interface SfjlManager {

	/**随访记录列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**新增随访记录
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**
	 * 通过id查询心电图数据
	 * @param pd
	 * @return
	 */
	public PageData findXDTById(PageData pd) throws Exception;
	
	/**修改随访记录
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**删除随访记录信息(协议状态改为9 ）
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**App随访记录查询接口
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * 获取随访属性
	 * @param pd
	 * @return
	 */
	public List<PageData> findColumn(PageData pd) throws Exception;
	/**
	 * 新增随访模版
	 * @param pd
	 * @throws Exception
	 */
	public void saveTemp(PageData pd) throws Exception;
	/**
	 * 新增心电图记录
	 * @param pd
	 * @throws Exception
	 */
	public void saveXdt(PageData pd) throws Exception;
	/**
	 * 新增随访模版明细
	 * @param pd
	 * @throws Exception
	 */
	public void saveTempDetail(PageData pd) throws Exception;
	/**
	 * 获取模版明细
	 * @param pd
	 * @return
	 */
	public List<PageData> findByTempId(PageData pd) throws Exception;
	
}
