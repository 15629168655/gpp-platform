package com.tbyf.service.gp.job;

import java.util.List;
import java.util.Map;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface TaskInfoManager  {
	

	/**定时任务列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**新增定时任务
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
	
	/**修改定时任务
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**删除定时任务
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**定时任务获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> querytask()throws Exception;


	/**定时任务获取时间列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map querytime(PageData pd) throws Exception;
	
	


}
