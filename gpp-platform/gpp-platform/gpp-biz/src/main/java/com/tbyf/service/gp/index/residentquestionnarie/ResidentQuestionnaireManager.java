package com.tbyf.service.gp.index.residentquestionnarie;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 居民问卷
 * @author zanxc
 *
 */
public interface ResidentQuestionnaireManager {

	/**居民问卷查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * app更新居民问卷查询
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 居民居民问卷查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增居民问卷查询
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改居民问卷查询
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取居民问卷查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除居民问卷查询
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 批量删除
	 * @param ids  选中删除的下标
	 * @throws Exception
	 */
	public void delAll(String[] ids )throws Exception;
	/**
	 * 通过居民ID查询问卷信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByResidentId(PageData pd)throws Exception;
	/**
	 * 更改分数和结果
	 * @param pd
	 * @throws Exception
	 */
	public void updateScore(PageData pd)throws Exception;
}
