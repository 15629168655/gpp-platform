package com.tbyf.service.gp.element;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 电子病历 元素 接口
 * 创建时间：2016.10.19
 * 作者：聂方
 */
public interface ElementManager {
	
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
	
	
	/**批量删除
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS)throws Exception;
	public  List<PageData> findByYSFLID(PageData pd)throws Exception;
}
