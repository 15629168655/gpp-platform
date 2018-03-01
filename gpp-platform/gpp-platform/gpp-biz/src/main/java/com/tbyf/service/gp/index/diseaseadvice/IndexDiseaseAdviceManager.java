package com.tbyf.service.gp.index.diseaseadvice;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 * 疾病诊断建议关联
 * @author zanxc
 *
 */
public interface IndexDiseaseAdviceManager {

	/**疾病诊断建议关联查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * app更新疾病诊断描述
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 更新疾病诊断描述
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增疾病诊断描述
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改疾病诊断描述
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID查询疾病诊断描述
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除疾病诊断描述
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 批量删除疾病诊断描述
	 * @param ids  选中删除的下标
	 * @throws Exception
	 */
	public void delAll(String[] ids )throws Exception;
	/**
	 * 查询生成的诊断记录
	 */
	public List<PageData> datalistCreate(Page page)throws Exception;
	
}
