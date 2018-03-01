package com.tbyf.service.hm.lisReport.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumAppResult;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.lisReport.LisReportManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.PageData;
import com.tbyf.util.UuidUtil;

/** 实验室检验报告表头
 * 创建时间：2016.10.26
 * 作者：聂方
 */

@Service("lisReportService")
public class LisReportService implements LisReportManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("LisReportMapper.listPage", page);
	}
	
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("LisReportMapper.findById", pd);
	}
	
	/**查询
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("LisReportMapper.queryPage", pd);
	}
	
	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("LisReportMapper.save", pd);
	}
	
	
	@Override
	public String saveListBatch(List<PageData> list)throws Exception{
		String result = EnumAppResult.REQUEST_FAILED.getCode();
		if(list!=null){
			for(PageData pd:list){//循环检查参数
				if(!AppUtil.checkParam("addLisReport", pd)){	//检查参数 
					result = EnumAppResult.PARAM_ABSENT.getCode();
					break;
				}else{
					pd.put("ID", UuidUtil.get32UUID());
				}
			}
			if(!result.equals(EnumAppResult.PARAM_ABSENT.getCode())){//参数检查通过
				dao.batchCommit("LisReportMapper.batchSave", Const.COMMIT_COUNT_EVERYTIME, list);//批量提交插入处理
				result = EnumAppResult.REQUEST_SUCCEED.getCode();
			}
		}
		return result;
	}

}
