package com.tbyf.service.hm.summary.impl;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumAppResult;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.summary.SummaryManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.PageData;
import com.tbyf.util.UuidUtil;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

/** 
 * 说明： 出院小结
 * @version
 */
@Service("summaryService")
public class SummaryService implements SummaryManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("SummaryManager.save", pd);
	}
	
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SummaryManager.findById", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SummaryManager.querylistPage", page);
	}
	@Override
	public String saveListBatch(List<PageData> list)throws Exception{
		String result = EnumAppResult.REQUEST_FAILED.getCode();
		if(list!=null){
			for(PageData pd:list){//循环检查参数
				if(!AppUtil.checkParam("queryAddSummary", pd)){	//检查参数 
					result = EnumAppResult.PARAM_ABSENT.getCode();
					break;
				}else{
					pd.put("ID", UuidUtil.get32UUID());
					pd.put("XGBZ", "0");//修改标志
				}
			}
			if(!result.equals(EnumAppResult.PARAM_ABSENT.getCode())){//参数检查通过
				dao.batchCommit("SummaryManager.batchSave", Const.COMMIT_COUNT_EVERYTIME, list);//批量提交插入处理
				result = EnumAppResult.REQUEST_SUCCEED.getCode();
			}
		}
		return result;
	}
}

