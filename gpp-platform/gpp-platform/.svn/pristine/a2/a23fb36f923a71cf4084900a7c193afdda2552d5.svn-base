package com.tbyf.service.hm.cismain.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumAppResult;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.cismain.CismainManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.PageData;
import com.tbyf.util.UuidUtil;

/**
 * 住院病案首页-接口
 *
 */
@Service("cismainService")
public class CismainService implements CismainManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("CismainMapper.datalistPage", page);
	}

	@Override
	public PageData findByJzlsh(PageData pd) throws Exception {
		return (PageData) dao.findForObject("CismainMapper.findByJzlsh", pd);
	}

	@Override
	public void save(PageData pd) throws Exception {
		dao.save("CismainMapper.save", pd);
	}
	
	/**通过医疗机构代码获取数据
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception
	{
		return (List<PageData>)dao.findForList("CismainMapper.findByYLJGDM",pd);
	}
	
	/**
	 * 批量采集住院病案首页数据
	 */
	@Override
	public String saveListBatch(List<PageData> list) throws Exception {
		String result = EnumAppResult.REQUEST_FAILED.getCode();
		if(list!=null){
			for(PageData pd:list){//循环检查参数
				if(!AppUtil.checkParam("saveCisMain", pd)){	//检查参数 
					result = EnumAppResult.PARAM_ABSENT.getCode();
					break;
				}else{
					pd.put("ID", UuidUtil.get32UUID());
				}
			}
			if(!result.equals(EnumAppResult.PARAM_ABSENT.getCode())){//参数检查通过
				dao.batchCommit("CismainMapper.batchSave", Const.COMMIT_COUNT_EVERYTIME, list);//批量提交插入处理
				result = EnumAppResult.REQUEST_SUCCEED.getCode();
			}
		}
		return result;
	}
	}


