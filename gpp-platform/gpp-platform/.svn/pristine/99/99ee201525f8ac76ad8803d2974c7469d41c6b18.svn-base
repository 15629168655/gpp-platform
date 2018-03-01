package com.tbyf.service.gp.lcxm;

import java.util.List;

import com.tbyf.entity.gp.Lcxm;
import com.tbyf.entity.system.Dictionaries;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：临床项目接口
 * 创建人：lizk
 * 创建时间：2017-02-07
 * @version
 */
public interface LcxmManager {

	public List<Lcxm> treeData(String ID) throws Exception;
	
	/**新增临床项目菜单
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**查询最大ID，新增时将最大ID值加1赋值给新增记录的ID
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findMaxId(PageData pd) throws Exception;
	
	/**去编辑页面时根据ID查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**修改临床项目菜单
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**删除临床项目菜单
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**根据BM查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByBM(PageData pd) throws Exception;
	
	/**收费项目树状列表
	 * @param ID
	 * @return
	 * @throws Exception
	 */
	public List<Dictionaries> goTreeData(String ID) throws Exception;
	
	public List<PageData> getParentMenu(PageData pd) throws Exception;
	
	public List<PageData> list(Page page) throws Exception;
	public List<Lcxm> findByPID(String PID) throws Exception;
	
}
