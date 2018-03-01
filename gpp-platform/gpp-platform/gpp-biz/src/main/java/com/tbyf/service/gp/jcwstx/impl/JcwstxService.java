package com.tbyf.service.gp.jcwstx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jcwstx.JcwstxManager;
import com.tbyf.util.PageData;

/**
 * 基层卫生提醒
 * @author Administrator
 *
 */
@Service("jcwstxService")
public class JcwstxService implements JcwstxManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 基层卫生提醒列表
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("JcwstxMapper.jcwstxlistPage", page);
	}

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("JcwstxMapper.save", pd);
	}
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("JcwstxMapper.findById", pd);
	}
	
	/**修改信息
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("JcwstxMapper.edit", pd);
		
	}
	
	/**修改状态（0：未读，1：已读，9：删除）
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editZT(PageData pd) throws Exception {
		dao.update("JcwstxMapper.editZT", pd);
	}
	
	/**单条标记为未读
	 * @param pd
	 * @throws Exception
	 
	@Override
	public void unRead(PageData pd) throws Exception {
		dao.update("JcwstxMapper.unRead", pd);
	}*/
	
	/**批量标记为已读
	 * @param IDS
	 * @throws Exception
	 
	public void readAll(String[] IDS)throws Exception{
		dao.delete("JcwstxMapper.readAll", IDS);
	}*/
	
	/**批量标记为未读
	 * @param IDS
	 * @throws Exception
	 */
	public void unReadAll(String[] IDS)throws Exception{
		dao.delete("JcwstxMapper.unReadAll", IDS);
	}
	
	/**app接口查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> appjcwstxlist(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("JcwstxMapper.appjcwstxlist", pd);
	}
	
}
