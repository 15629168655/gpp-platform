package com.tbyf.service.gp.sfjl.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.sfjl.SfjlHypertensionManager;
import com.tbyf.util.PageData;


/**
 * 高血压随访
 * @author wangc
 *
 */

@Service("sfjlHypertensionService")
public class SfjlHypertensionService  implements SfjlHypertensionManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**随访记录列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SfjlHypertensionMapper.datalistPage", page);
	}
	
	/**新增随访记录
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		
		//String  sfcl=String.valueOf(pd.get("SFCL"));
		//说明这个地方可以判断插不插 谁访参数信息表 .插该表意义不大 目前先插 。具体带以后商定
		dao.save("SfjlHypertensionMapper.savesfzb", pd); //
		dao.save("SfjlHypertensionMapper.savesfinf", pd); 
	}
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("SfjlHypertensionMapper.findById", pd);
	}
	
	/**修改随访记录
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
	//dao.update("SfjlHypertensionMapper.editper", pd);//修改随访人员信息表
	dao.update("SfjlHypertensionMapper.editsfzb", pd);//修改随访信息主表
	dao.update("SfjlHypertensionMapper.editsfinf", pd);//修改随访记录参数信息表
	
		//return (PageData)dao.produ("SfjlHypertensionMapper.edit", pd);

	}
	
	/**修改随访记录
	 * @param pd
	 * @throws Exception
	 */
/*	@Override
	public Map test(Map pd) throws Exception {
		
		
		return (Map) new DaoSupport().test("SfjlHypertensionMapper.test", pd);
		
		
	}*/
	
	/**删除随访记录信息(协议状态改为9 ）
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.update("SfjlHypertensionMapper.delete", pd);
	}
	
	
	@Override
	public void appdelete(PageData pd) throws Exception {
		String idsstr=pd.getString("IDS");
		String[] ARRIDS = idsstr.split(",");
		StringBuffer IDS =new StringBuffer();
		IDS.append("(");
		  for(int i=0;i<ARRIDS.length ;i++){
			  IDS.append('\'').append(ARRIDS[i]).append("',");
		  }
		  IDS.deleteCharAt(IDS.length() - 1);
		  IDS.append(")");
		pd.put("IDS", IDS);
		dao.update("SfjlHypertensionMapper.appdelete", pd);
		
	}

	
	/**
	 * APP随访记录查询接口
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("SfjlHypertensionMapper.queryPage", pd);
	}

	/**
	 * 获取高血压所有随访记录包含居民信息 医生信息，等
	 * 
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> sfjlHypertensionAllInfo(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("SfjlHypertensionMapper.sfjlHypertensionAllInfo", pd);
	}
	

}
