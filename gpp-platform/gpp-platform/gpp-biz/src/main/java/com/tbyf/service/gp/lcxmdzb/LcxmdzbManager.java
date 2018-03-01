package com.tbyf.service.gp.lcxmdzb;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 
 * 说明：临床项目接口
 * 创建人：lizk
 * 创建时间：2017-02-07
 * @version
 */
public interface LcxmdzbManager {

	/**列出临床项目对照表信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**删除临床项目对照表信息
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**根据ID查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd) throws Exception;
	
	/**保存新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**根据收费项目编码查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findBySFXM(PageData pd) throws Exception;
	
	/**修改数量
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	public List<PageData> queryByBM(PageData pd) throws Exception;
}
