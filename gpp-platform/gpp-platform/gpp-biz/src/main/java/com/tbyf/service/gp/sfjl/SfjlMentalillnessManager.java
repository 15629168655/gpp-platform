package com.tbyf.service.gp.sfjl;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface SfjlMentalillnessManager {

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

	
	/**App随访删除接口接口
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public void appdelete(PageData pd) throws Exception;
	
	



}
