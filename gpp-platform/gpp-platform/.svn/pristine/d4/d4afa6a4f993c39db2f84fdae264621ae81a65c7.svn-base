package com.tbyf.service.gp.job.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.job.TaskInfoManager;
import com.tbyf.util.PageData;

/**
 * 
 * 对定时任务的增加删查改
 * @author Administrator
 *
 */
@Service("taskInfoService") 
public class TaskInfoService  implements TaskInfoManager{
	
 
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**定时任务列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TaskInfoMapper.datalistPage", page);
	}
	
	/**新增定时任务
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		 UUID uuid = UUID.randomUUID();
		 pd.put("GUID",uuid);
		dao.save("TaskInfoMapper.savezb", pd); 
	}
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("TaskInfoMapper.findById", pd);
	}
	
	/**修改定时任务
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
	dao.update("TaskInfoMapper.edit", pd);//修改定时任务主表信息

	}
	

	
	/**删除定时任务
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.update("TaskInfoMapper.delete", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> querytask() throws Exception {
		PageData pd =new PageData();
		pd.put("STATUS", "1");//1开启 0 禁用
		return (List<PageData>)new DaoSupport().findForList("TaskInfoMapper.querytask", pd);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Map querytime(PageData pd) throws Exception {
		List<PageData>pg=(List<PageData>) dao.findForList("TaskInfoMapper.querytime", pd);
		Map  map = new HashMap();
		if(null!=pg&&pg.size()>0){
			for(int  i=0;i<pg.size();i++){
				map.put(pg.get(i).get("GUID"), pg.get(i).get("TIMEDES"));
			}
		}	
		return map;
	}
	
	
	
}
