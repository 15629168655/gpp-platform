package com.tbyf.service.gp.sfjl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.sfjl.SfjlMentalillnessManager;
import com.tbyf.util.PageData;

@Service("sfjlMentalillnessService")
public class SfjlMentalillnessService  implements SfjlMentalillnessManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**随访记录列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SfjlMentalillnessMapper.datalistPage", page);
	}
	
	/**新增随访记录
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("SfjlMentalillnessMapper.savesfzb", pd);
		dao.save("SfjlMentalillnessMapper.savesfinf", pd); 
	}
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("SfjlMentalillnessMapper.findById", pd);
	}
	
	/**修改随访记录
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
	dao.update("SfjlMentalillnessMapper.editsfzb", pd);//修改随访信息主表
	dao.update("SfjlMentalillnessMapper.editsfinf", pd);//修改随访记录参数信息表

	}

	
	/**删除随访记录信息(协议状态改为9 ）
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.update("SfjlMentalillnessMapper.delete", pd);
	}
	
	/**
	 * APP随访记录查询接口
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		 return (List<PageData>)dao.findForList("SfjlMentalillnessMapper.queryPage", pd);
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
		//if(ARRIDS.length>1){
		pd.put("IDS", IDS);
		dao.update("SfjlMentalillnessMapper.appdelete", pd);
	/*	}

		else{
			dao.update("SfjlMentalillnessMapper.delete", pd);
		}*/
		
		
	}
	
}
	