package com.tbyf.service.system.attachment.impl;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.system.attachment.AttachmentManager;
import com.tbyf.util.PageData;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

/** 
 * 说明： 附件上传
 * 创建人：
 * 创建时间：2016-06-24
 * @version
 */
@Service("attachmentService")
public class AttachmentService implements AttachmentManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("AttachmentMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("AttachmentMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("AttachmentMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AttachmentMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AttachmentMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AttachmentMapper.findById", pd);
	}

	/**
	 * 通过业务ID，业务类型获取数据
	 *
	 * @param businessid
	 * @param businesstype
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> findByBusiness(String businessid, String businesstype) throws Exception {
		PageData pd = new PageData();
		pd.put("BUSINESS_ID",businessid);
		pd.put("TYPE",businesstype);
		return (List<PageData>)dao.findForList("AttachmentMapper.findByBusiness", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("AttachmentMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> findByBusinessID(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("AttachmentMapper.findByBusinessId", pd);
	}

	/**
	 * 根据修改协议表修改数据
	 */
	@Override
	public void editForXywh(PageData pd) throws Exception {
		dao.update("AttachmentMapper.editForXywh", pd);
		
	}
	
}

