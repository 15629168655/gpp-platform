package com.tbyf.service.hm.lisIndicators;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/** 检验结果指标 接口类
 * 创建时间：2016.10.27
 * 作者：聂方
 */
public interface LisIndicatorsManager {
	
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
	
	/**app查询(分页)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**实验室报告跳转至相应的检查结果标准list
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listbybgdh(Page page)throws Exception;


}
