package com.tbyf.service.gp.task.impl;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.task.TaskManager;
import com.tbyf.util.PageData;

/** 全科医生任务管理
 * 创建时间：2016.9.5
 * 作者：聂方
 */

@Service("taskService")
public class TaskService implements TaskManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**任务列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TaskMapper.tasklistPage", page);
	}
	
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TaskMapper.findById", pd);
	}


	
	/**保存任务
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("TaskMapper.save", pd);
	}
	
	/**修改任务
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("TaskMapper.edit", pd);
	}
	
	/**删除任务
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("TaskMapper.delete", pd);
	}
	
	/**处理任务
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void process(PageData pd)throws Exception{
		dao.delete("TaskMapper.process", pd);
	}
	
	/**批量删除任务
	 * @param IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] IDS,String OPERATOR_ID,String OPERATOR_NAME,String STATUS)throws Exception{
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("OPERATOR_ID", OPERATOR_ID);
		param.put("OPERATOR_NAME", OPERATOR_NAME);
		param.put("IDS", IDS);
		param.put("STATUS", STATUS);
		dao.delete("TaskMapper.deleteAll", param);
	}
	
	/**app查询任务列表
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TaskMapper.queryPage", pd);
	}
	
	/**app新增
	 * @param pd
	 * @throws Exception
	 */
	//@Override
	//public void addTask(PageData pd)throws Exception{
	//	dao.save("TaskMapper.addTask", pd);
	//}
	
	/**保存系统任务---签约
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveQy(PageData pd)throws Exception{
		dao.save("TaskMapper.saveQy", pd);
	}

}
