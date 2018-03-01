package com.tbyf.service.gp.hospitalization;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 住院证接口
 * 创建时间：2016.9.26
 * 作者：聂方
 */
public interface HospitalizationManager {
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	

	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	

	/**批量获取
	 * @param ArrayDATA_IDS
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getAllById(String[] ArrayDATA_IDS)throws Exception;
	
	/**批量删除
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS)throws Exception;
	
	/**app查询(分页)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**app新增
	 * @param pd
	 * @throws Exception
	 */
	//public void addHospitalization(PageData pd)throws Exception;

}
