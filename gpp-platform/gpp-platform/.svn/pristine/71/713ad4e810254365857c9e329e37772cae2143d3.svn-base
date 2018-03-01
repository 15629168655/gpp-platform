package com.tbyf.service.gp.index.score;


import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 评分等级表
 * @author zanxc
 * @创建日期2017年8月4日下午5:15:26
 */
public interface IndexScoreManager {

	/**
	 * 显示问卷所有的评分项目
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**
	 * 保存评分等级表
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	/**
	 * 通过问卷ID查询评分等级
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByScreeningQuesId(PageData pd) throws Exception;
	/**
	 * 删除该筛查问卷的评分等级
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByScreeningQuesId(PageData pd) throws Exception;
}
