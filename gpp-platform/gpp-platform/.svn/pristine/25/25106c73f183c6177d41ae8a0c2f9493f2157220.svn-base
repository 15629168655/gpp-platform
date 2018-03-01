package com.tbyf.service.gp.sfjl.impl;

import java.sql.Blob;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.sfjl.SfjlManager;
import com.tbyf.util.BlobUtil;
import com.tbyf.util.PageData;

/** 
 * 说明：随访记录
 * 创建人：lizk
 * 创建时间：2016-10-12
 * @version
 */
@Service("sfjlService")
public class SfjlService implements SfjlManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**随访记录列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SfjlMapper.datalistPage", page);
	}
	
	/**新增随访记录
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("SfjlMapper.save", pd);
	}
	
	/**新增随访模版
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveTemp(PageData pd)throws Exception{
		dao.save("SfjlMapper.saveTemp", pd);
	}
	
	/**新增心电图记录
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveXdt(PageData pd)throws Exception{
		dao.save("SfjlMapper.saveXdt", pd);
	}
	
	/**新增随访模版明细
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveTempDetail(PageData pd)throws Exception{
		dao.save("SfjlMapper.saveTempDetail", pd);
	}
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("SfjlMapper.findById", pd);
	}
	
	/**
	 * 通过id查询心电图数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findXDTById(PageData pd) throws Exception {
		pd = (PageData) dao.findForObject("SfjlMapper.findXDTById", pd);
		JSONArray ECGI = JSONArray.fromObject(BlobUtil.blobObjectToString(pd.get("ECGI")));
		JSONArray ECGII = JSONArray.fromObject(BlobUtil.blobObjectToString(pd.get("ECGII")));
		JSONArray ECGIII = JSONArray.fromObject(BlobUtil.blobObjectToString(pd.get("ECGIII")));
		JSONArray ECGAVR = JSONArray.fromObject(BlobUtil.blobObjectToString(pd.get("ECGAVR")));
		JSONArray ECGAVL = JSONArray.fromObject(BlobUtil.blobObjectToString(pd.get("ECGAVL")));
		JSONArray ECGAVF = JSONArray.fromObject(BlobUtil.blobObjectToString(pd.get("ECGAVF")));
		JSONArray ECGV = JSONArray.fromObject(BlobUtil.blobObjectToString(pd.get("ECGV")));
		pd.clear();
		pd.put("ECGI", ECGI);
		pd.put("ECGII", ECGII);
		pd.put("ECGIII", ECGIII);
		pd.put("ECGAVR", ECGAVR);
		pd.put("ECGAVL", ECGAVL);
		pd.put("ECGAVF", ECGAVF);
		pd.put("ECGV", ECGV);
		return pd;
	}
	
	/**
	 * 通过模版id获取模版详情
	 * @param pd
	 * @return
	 */
	@Override
	public List<PageData> findByTempId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("SfjlMapper.findByTempId", pd);
	}
	
	/**
	 * 获取随访属性
	 * @param pd
	 * @return
	 */
	@Override
	public List<PageData> findColumn(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("SfjlMapper.findProperty", pd);
	}
	
	/**修改随访记录
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("SfjlMapper.edit", pd);
		
	}
	
	/**删除随访记录信息(协议状态改为9 ）
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.update("SfjlMapper.delete", pd);
		
	}
	
	/**
	 * APP随访记录查询接口
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("SfjlMapper.queryPage", pd);
	}
	
}
