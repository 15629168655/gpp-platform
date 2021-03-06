package com.tbyf.service.hm.yhry;

import java.util.List;

import com.tbyf.entity.hm.Yhry;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;
/**
 * 医护人员接口
 * @author Administrator
 *
 */
public interface YhryManager {
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
	public List<PageData> yhrylist(Page page)throws Exception;
	
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
	
	/**通过医护人员id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByProviderId(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**
	 * 通过org_code查询机构下的医护人员
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<Yhry> listSubYhryByParentId(String parentId) throws Exception;
	/**
	 * 查询授权方案的医生的医护人员
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> dataCaseYhry(Page page) throws Exception;

}
