package com.tbyf.service.hm.cismain;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 住院病案首页接口
 * @author lh
 *
 */
public interface CismainManager {

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 查看详情
	 * @param pd
	 * @return
	 */
	public PageData findByJzlsh(PageData pd) throws Exception ;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	public List<PageData> queryPage(PageData pd) throws Exception;
	
	public String saveListBatch(List<PageData> list)throws Exception;
}