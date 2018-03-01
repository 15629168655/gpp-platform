package com.tbyf.service.gp.task;

import java.util.List;







import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 全科医生任务管理接口
 * 创建时间：2016.9.5
 * 作者：聂方
 */

public interface TaskManager {
	
	/**任务列表
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
	
	/**修改任务
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**保存任务
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除任务
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**处理任务
	 * @param pd
	 * @throws Exception
	 */
	public void process(PageData pd)throws Exception;
	
	/**批量删除任务
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS,String OPERATOR_ID,String OPERATOR_NAME,String STATUS)throws Exception;
	
	/**app查询(分页)任务
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**app新增
	 * @param pd
	 * @throws Exception
	 */
	//public void addTask(PageData pd)throws Exception;
	
	
	/**保存系统任务---签约
	 * @param pd
	 * @throws Exception
	 */
	public void saveQy(PageData pd)throws Exception;
	

}
