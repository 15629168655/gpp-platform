package com.tbyf.service.system.attachment;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明： 附件上传接口
 * 创建人：
 * 创建时间：2016-06-24
 * @version
 */
public interface AttachmentManager{
	 

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	/**
	 * 通过业务ID，业务类型获取数据
	 * @param businessid
	 * @param businesstype
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByBusiness(String businessid, String businesstype)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**
	 * 通过业务ID获取数据
	 * @param businessid
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByBusinessID(PageData pd)throws Exception;
	
	/**根据修改协议表修改附件
	 * @param pd
	 * @throws Exception
	 */
	public void editForXywh(PageData pd)throws Exception;
	
}
