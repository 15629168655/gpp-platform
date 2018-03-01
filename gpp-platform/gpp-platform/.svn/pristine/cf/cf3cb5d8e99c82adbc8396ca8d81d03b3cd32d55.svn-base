package com.tbyf.service.gp.servicePack;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 服务包接口
 * @author lizk
 *2016-11-17
 */
public interface ServicePackManager {

	/**服务包列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**app接口服务包列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> querylistforApp(PageData pd)throws Exception;
	
	/**服务包编码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> PackBM(Page page)throws Exception;
	
	/**新增服务包
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**根据编码查询记录，录入时确保唯一
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByBM(PageData pd) throws Exception;
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**修改服务包
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 修改服务包状态
	 * @param pg
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception;
	
}
