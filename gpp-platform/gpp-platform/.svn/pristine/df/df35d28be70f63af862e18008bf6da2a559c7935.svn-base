package com.tbyf.service.gp.sftemp.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.sfjl.SfjlManager;
import com.tbyf.service.gp.sftemp.SfTempManager;
import com.tbyf.util.PageData;

/** 
 * 说明：随访模版
 * 创建人：liwb
 * 创建时间：2017-8-3
 * @version
 */
@Service("sfTempService")
public class SfTempService implements SfTempManager{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**新增随访模版
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("SfTempMapper.saveTemp", pd);
	}
	
	/**
	 * 通过GUID查询随访模版详情
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findByGUID(PageData pd) throws Exception {
		PageData pd1 = (PageData)dao.findForObject("SfTempMapper.findByGUID", pd);
		List<PageData> list = (List<PageData>) dao.findForList("SfTempMapper.findDetailByTEMP_ID", pd);
		for(PageData pd2: list){
			pd1.put(pd2.getString("COLUMN_ID"), pd2.getString("COLUMN_NAME"));
		}
		return pd1;
	}
	
	/**修改随访模版
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("SfTempMapper.editTemp", pd);
	}
	
	/**删除随访模版
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("SfTempMapper.deleteTemp", pd);
	}
	
	/**根据TEMP_ID删除随访模版明细
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deteteDetailByTEMP_ID(PageData pd) throws Exception {
		dao.delete("SfTempMapper.deteteDetailByTEMP_ID", pd);
	}

	/**查询随访模版列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("SfTempMapper.queryPage", pd);
	}
	
	/**
	 * 新增随访模版明细
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveTempDetail(PageData pd) throws Exception {
		dao.save("SfTempMapper.saveTempDetail", pd);
	}

}
